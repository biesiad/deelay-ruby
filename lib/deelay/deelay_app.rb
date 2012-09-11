require "sinatra"
require "uri"

module Deelay
  class DeelayApp < Sinatra::Application
    get '/' do
      "Deelay app is running<BR>TODO: Add info here"
    end

    get '/:delay' do
      delay = params[:delay].to_i
      url = params[:url]

      redirect('http://deelay.me/') if (url =~ URI::regexp).nil?

      sleep delay
      redirect url
    end

  end
end
