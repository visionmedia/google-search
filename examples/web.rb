
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'

search = Google::Search.new :web, :size => :large, :query => 'Victoria Web Design'
response = search.get_response