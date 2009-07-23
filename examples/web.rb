
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'


def page_index_for uri, query
  search = Google::Search.new :web, :size => :large, :query => query.url_encode
  search.get_response.items.find do |item|
    if item.uri == uri
      item.index
    end
  end
end

p page_index_for('http://vision-media.ca/', 'Victoria Web Design')