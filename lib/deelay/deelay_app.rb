require "sinatra"
require "uri"

module Deelay
class DeelayApp < Sinatra::Base

  get '/:delay' do
    delay = params[:delay].to_i
    url = URI.unescape(request.query_string)

    raise "Invalid URL" if (URI::regexp =~ url).nil?

    sleep(delay / 1000)
    redirect url
  end

  error do
    redirect "#{Deelay::HOMEPAGE}/error"
  end

end
end
