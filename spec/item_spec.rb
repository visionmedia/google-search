
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Item do
  describe ".class_for" do
    it "should return a constant" do
      Google::Search::Item.class_for('GwebSearch').should == Google::Search::Item::Web
    end
  end
end

describe Google::Search::Item::Web do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('web-response')['responseData']['results'].first
      item = Google::Search::Item::Web.new hash
      item.title.should include('foobar - Wikipedia')
      item.contents.should include('Foobar is often used')
      item.uri.should == 'http://en.wikipedia.org/wiki/Foobar'
      item.cache_uri.should == 'http://www.google.com/search?q=cache:4styY9qq7tYJ:en.wikipedia.org'
      item.visible_uri.should == 'en.wikipedia.org'
      item.unescaped_uri.should == 'http://en.wikipedia.org/wiki/Foobar'
    end
  end
end