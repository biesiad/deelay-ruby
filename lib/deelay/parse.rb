require "uri"

module Deelay
  def self.parse(url)
    resource_url = URI.unescape(url)
    raise "Invalid URL" if (URI::regexp =~ resource_url).nil?

    return resource_url
  end
end
