
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Item do
  before :each do
    @search = Google::Search.new :web, :query => 'foo'
  end
end