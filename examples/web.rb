
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'


def find_uri uri, query = nil
  @search = Google::Search.new(:web, :query => query, :size => :large) if query
  puts "... Searching page %d for `%s'" % [(@search.offset / 8) + 1, @search.query.url_decode]
  response = @search.next.response
  return unless response.valid?
  response.items.find do |item|
    item.uri =~ uri
  end || find_uri(uri)
end

p find_uri(/axemusic.com/, 'Axe Music'.url_encode)