
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'
require 'rext/all'


def page_index_for uri, options = {}
  @search = Google::Search.new(:web, options) unless options.empty?
  puts "... Searching page %d for `%s'" % [(@search.offset / 8) + 1, @search.query.url_decode]
  @search.next.response.items.find do |item|
    if item.uri =~ uri
      item.index
    end
  end || page_index_for(uri)
end

p page_index_for(/vision-media/, :size => :large, :query => 'Victoria Web Design'.url_encode)
p page_index_for(/victoriawebschool/, :size => :large, :query => 'Victoria Web School'.url_encode)
p page_index_for(/victoriawebschool/, :size => :large, :query => 'Web Design School'.url_encode)
