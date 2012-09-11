require "sinatra"
require "uri"

module Deelay
class DeelayApp < Sinatra::Application

  get '/:delay' do
    delay = params[:delay].to_i
    url = request.query_string

    sleep(delay / 1000)
    redirect url
  end

end
end
