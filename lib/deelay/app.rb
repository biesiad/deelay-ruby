require "sinatra/async"

module Deelay
  class App < Sinatra::Base
    register Sinatra::Async

    aget '/:delay' do |delay|
      EM.add_timer(delay.to_i/1000) do
        async_schedule { redirect Deelay.parse(request.query_string) }
      end
    end
  end
end
