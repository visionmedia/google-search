
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'

def find_item uri, query = nil
  @search = Google::Search.new(:web, :query => query.url_encode, :size => :large) if query
  @search.each_response { print '.'; $stdout.flush }
  @search.find { |item| item.uri =~ uri }
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
