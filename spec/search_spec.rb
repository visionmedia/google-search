
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
    it "should return a uri" do
      @search.get_uri.should == 'http://www.google.com/uds/GwebSearch?start=0&rsz=small&hl=en&key=notsupplied&v=1.0&q=foo'
    end
  end
  
  describe "#get_raw" do
    it "should return JSON string" do
      @search.get_raw.should be_a(String)
    end
  end
  
  describe "#get_hash" do
    it "should return JSON converted to a hash" do
      @search.stub!(:get_raw).and_return fixture('web-response.json')
      @search.get_hash.should be_a(Hash)
    end
  end
  
  describe "#get_response" do
    it "should return a Response object" do
      @search.stub!(:get_raw).and_return fixture('web-response.json')
      @search.get_response.should be_a(Google::Search::Response)
    end
    
    it "should populate #raw" do
      @search.stub!(:get_raw).and_return fixture('web-response.json')
      @search.get_response.raw.should be_a(String)
    end
  end
  
  describe "#get_more_uri" do
    it "should return a uri to the new offset" do
      @search.get_more_uri.should == 'http://www.google.com/uds/GwebSearch?start=4&rsz=small&hl=en&key=notsupplied&v=1.0&q=foo'
      @search.get_more_uri.should == 'http://www.google.com/uds/GwebSearch?start=8&rsz=small&hl=en&key=notsupplied&v=1.0&q=foo'
      @search.size = :large
      @search.offset = 0
      @search.get_more_uri.should == 'http://www.google.com/uds/GwebSearch?start=8&rsz=large&hl=en&key=notsupplied&v=1.0&q=foo'
      @search.get_more_uri.should == 'http://www.google.com/uds/GwebSearch?start=16&rsz=large&hl=en&key=notsupplied&v=1.0&q=foo'
    end
  end
end