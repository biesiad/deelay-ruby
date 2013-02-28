require_relative "delay.rb"
require "sinatra"

module Deelay
  class App < Sinatra::Base

    get '/:delay' do
      redirect Deelay.delay(params[:delay], request.query_string)
    end

  end
end
