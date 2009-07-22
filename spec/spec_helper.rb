
$:.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'google-search'

def fixture path
  File.read File.dirname(__FILE__) + "/fixtures/#{path}"
end

def json_fixture name
  JSON.parse fixture("#{name}.json")
end