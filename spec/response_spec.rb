
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Response do
  describe "#valid?" do
    it "should return false when response status is not 200" do
      response = Google::Search::Response.new 'responseStatus' => 400
      response.should_not be_valid
    end
    
    it "should return true when status is 200" do
      response = Google::Search::Response.new 'responseStatus' => 200, 'responseData' => { 'results' => [] }
      response.should be_valid
    end
  end
  
  describe "#items" do
    it "should be an array of items" do
      response = Google::Search::Response.new json_fixture('web-response')
      response.items.first.should be_a(Google::Search::Item)
    end
  end
end