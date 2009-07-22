
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search do
  before :each do
    @search = Google::Search.new :web, :query => 'foo'
  end
  
  describe "#initialize" do
    it "should accept the type of search" do
      @search.type.should == :web
    end
  end
  
  describe "#get_uri" do
    it "should return a URI" do
      @search.get_uri.should == 'http://www.google.com/uds/GwebSearch?lstkp=0&rsz=small&hl=en&key=notsupplied&v=1.0&q=foo'
    end
  end
  
  describe "#get_raw" do
    it "should return JSON string" do
      @search.get_raw.should be_a(String)
    end
  end
  
  describe "#get_hash" do
    it "should return JSON converted to a hash" do
      @search.get_hash.should be_a(Hash)
      p @search.get_hash
    end
  end
end