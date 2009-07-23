
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
      item.content.should include('Foobar is often used')
      item.uri.should == 'http://en.wikipedia.org/wiki/Foobar'
      item.cache_uri.should == 'http://www.google.com/search?q=cache:4styY9qq7tYJ:en.wikipedia.org'
      item.visible_uri.should == 'en.wikipedia.org'
      item.unescaped_uri.should == 'http://en.wikipedia.org/wiki/Foobar'
    end
  end
end

describe Google::Search::Item::Video do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('video-response')['responseData']['results'].first
      item = Google::Search::Item::Video.new hash
      item.title.should include('Foo Fighters')
      item.content.should include('Foo Fighters')
      item.uri.should == 'http://www.google.com/url?q=http://www.youtube.com/watch%3Fv%3DTVboOdX9icA&source=video&vgc=rss&usg=AFQjCNFvZftyyTO-IswoCPWEmmQbskBMRA'
      item.rating.should == 4.9076071
      item.type.should == 'YouTube'
      item.published.should be_a(DateTime)
      item.thumbnail_uri.should == 'http://0.gvt0.com/vi/TVboOdX9icA/default.jpg'
      item.publisher.should == 'www.youtube.com'
      item.duration.should == 269
    end
  end
end