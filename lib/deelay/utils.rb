require 'uri'

module Deelay
  def self.parse_query_string(query_string)
    escaped_url = ::URI.unescape(query_string)
    raise ArgumentError, "Missing URL" if query_string.empty?

    url = (escaped_url =~ /^http:\/\// ? "" : "http://") + escaped_url
    return url
  end

  def self.parse_splat(splat, query_string)
    raise ArgumentError, "Missing URL" if splat.empty?

    escaped_url = ::URI.unescape(splat)
    protocol = (escaped_url =~ /^https:/) ? 'https' : 'http'
    url = escaped_url.sub(/^(http|https):\//, "#{protocol}://")
    url = "#{protocol}://" + url if url !~ /^#{protocol}:\/\//
    url << "?" + query_string if !query_string.empty?
    return url
  end
end
