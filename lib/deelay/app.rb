require 'sinatra/async'
require 'uri'

module Deelay
  class App < Sinatra::Base
    register Sinatra::Async

    aget '/:delay' do
      resource_url = parse(request.query_string)

      EM.add_timer(params[:delay].to_i / 1000) do
        em_async_schedule { redirect resource_url }
      end
    end

    private

    def parse(url)
      unescaped_url = ::URI.unescape(url)

      raise "Invalid URL" if (::URI::regexp =~ unescaped_url).nil?
      return unescaped_url
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

