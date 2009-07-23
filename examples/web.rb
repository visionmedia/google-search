
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'


def page_index_for uri, search
  search.next.response.items.find do |item|
    if item.uri == uri
      item.index
    end
  end || page_index_for(uri, search)
end

search = Google::Search.new :web, :size => :large, :query => 'Victoria Web Design'.url_encode
p page_index_for('http://vision-media.ca/', search)