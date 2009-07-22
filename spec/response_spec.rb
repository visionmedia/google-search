
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Response do
  describe "#valid?" do
    it "should return false when response status is not 200" do
      response = Google::Search::Response.new 'responseStatus' => 400
      response.should_not be_valid
    end
    
    it "should return true when status is 200" do
      response = Google::Search::Response.new 'responseStatus' => 200
      response.should be_valid
    end
  end
  
  describe "#items" do
    it "should be an array of items" do
      response = Google::Search::Response.new 'responseData' => {
        'results' => [
          {"GsearchResultClass"=>"GwebSearch",
            "title"=>"foobar - Wikipedia, the free encyclopedia",
            "url"=>"http://en.wikipedia.org/wiki/Foobar",
            "cacheUrl"=>
             "http://www.google.com/search?q=cache:4styY9qq7tYJ:en.wikipedia.org",
            "content"=>
             "Foobar is often used alone; <b>foo</b>, bar, and baz are usually used in that order,   <b>...</b> <b>Foo</b> has entered the English language as a neologism and is considered by <b>...</b>",
            "visibleUrl"=>"en.wikipedia.org",
            "titleNoFormatting"=>"foobar - Wikipedia, the free encyclopedia",
            "unescapedUrl"=>"http://en.wikipedia.org/wiki/Foobar"}  
        ]
      }
      response.items.first.should be_a(Google::Search::Item)
    end
  end
end