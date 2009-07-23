
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'


def find_item uri, query = nil
  @search = Google::Search.new(:web, :query => query.url_encode, :size => :large) if query
  puts "... Searching for `%s'" % [@search.query.url_decode]
  response = @search.next.response
  return unless response.valid?
  response.items.find do |item|
    item.uri =~ uri
  end || find_item(uri)
end

def find uri, query
  if item = find_item(uri, query)
    puts "... Result #%d" % (item.index + 1)
  else
    puts "... Not found"
  end
end

find /northstudio\.com/, 'Victoria Drupal'
find /northstudio\.com/, 'Victoria Web Design'
