require "uri"

module Deelay
  def self.delay(delay, url)
    sleep_time = delay.to_i
    resource_url = URI.unescape(url)

    raise "Invalid URL" if (URI::regexp =~ resource_url).nil?

    sleep(sleep_time / 1000)
    return resource_url
  end
end
