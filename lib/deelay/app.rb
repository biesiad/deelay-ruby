require 'sinatra/async'
require 'uri'

module Deelay
  class App < Sinatra::Base
    register Sinatra::Async

    aget '/:delay' do
      url = parse_query_string(request.query_string)
      redirect_to url
    end

    aget '/:delay/*' do
      url = parse_splat(params[:splat].join("/"), request.query_string)
      redirect_to url
    end

    private

    def redirect_to(url, delay = 0)
      EM.add_timer(delay / 1000) do
        em_async_schedule { redirect url }
      end
    end

    def parse_query_string(raw_url)
      escaped_url = ::URI.unescape(raw_url)
      raise ArgumentError, "Missing URL" if request.query_string.empty?

      url = (escaped_url =~ /^http:\/\// ? "" : "http://") + escaped_url
      return url
    end

    def parse_splat(raw_url, query_string)
      raise ArgumentError, "Missing URL" if raw_url.empty?

      escaped_url = ::URI.unescape(raw_url)
      url = escaped_url.sub(/^http:\//, "http://")
      url = "http://" + url if url !~ /^http:\/\//
      url << "?" + request.query_string if !request.query_string.empty?
      return url
    end

    def validate(url)
      raise "Invalid url" if url =~ /(http|https)/
    end

    # swaps env when testing
    def em_async_schedule
      o = self.class.environment
      self.class.set :environment, :normal
      async_schedule { yield }
    ensure
      self.class.set :environment, o
    end
  end
end

