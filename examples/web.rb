
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'

def find_item uri, query = nil
  @search = Google::Search.new(:web, :query => query.url_encode, :size => :large) if query
  print '.'; $stdout.flush
  response = @search.next.response
  return unless response.valid?
  response.items.find do |item|
    item.uri =~ uri
  end || find_item(uri)
end

def find uri, query
  print "%35s " % query
  if item = find_item(uri, query)
    puts " #%d" % (item.index + 1)
  else
    puts " Not found"
  end
end

find /vision\-media\.ca/, 'Victoria Web Training'
find /vision\-media\.ca/, 'Victoria Web School'
find /vision\-media\.ca/, 'Victoria Web Design'
find /vision\-media\.ca/, 'Victoria Drupal'
find /vision\-media\.ca/, 'Victoria Drupal Development'
