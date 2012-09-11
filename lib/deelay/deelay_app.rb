require "sinatra"
require "uri"

module Deelay
class DeelayApp < Sinatra::Base

  get '/:delay' do
    delay = params[:delay].to_i
    url = request.query_string

    raise "Invalid URL" if (URI::regexp =~ url).nil?

    sleep(delay / 1000)
    redirect url
  end

  error 400..510 do
    "<script>(function () { location.href = '#{Deelay::HOMEPAGE}/error'; }())</script>"
  end

end
end
