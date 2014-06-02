require 'sinatra/async'

module Deelay
  class App < Sinatra::Base
    register Sinatra::Async

    aget '/:delay' do
      url = Deelay.parse_query_string(request.query_string)
      redirect_to(url, params[:delay].to_i)
    end

    aget '/:delay/*' do
      url = Deelay.parse_splat(params[:splat].join("/"), request.query_string)
      redirect_to(url, params[:delay].to_i)
    end


    private

    def redirect_to(url, delay = 0)
      EM.add_timer(delay / 1000) do
        em_async_schedule { redirect url }
      end
    end

    # swaps env when testing
    def em_async_schedule
      env = self.class.environment
      self.class.set :environment, :normal
      async_schedule { yield }
    ensure
      self.class.set :environment, env
    end
  end
end
