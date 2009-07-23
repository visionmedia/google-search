
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

describe Google::Search::Item::Blog do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('blog-response')['responseData']['results'].first
      item = Google::Search::Item::Blog.new hash
      item.title.should include('Foo (51)')
      item.author.should == 'KNews'
      item.uri.should == 'http://www.kaieteurnewsonline.com/2009/07/22/foo-51-amsterdam-4-12-shine-for-guyana-on-opening-day/'
      item.blog_uri.should == 'http://www.kaieteurnewsonline.com/'
      item.content.should include('Jonathon')
      item.published.should be_a(DateTime)
    end
  end
end

describe Google::Search::Item::Book do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('book-response')['responseData']['results'].first
      item = Google::Search::Item::Book.new hash
      item.title.should include('Foo Fighters')
      item.author.should == '<b>Foo</b> Fighters (CRT), Hal Leonard Publishing Corporation'
      item.id.should == 'ISBN1423404580'
      item.uri.should == 'http://books.google.com/books%3Fid%3DvUoCAgAACAAJ%26dq%3Dfoo%26client%3Dinternal-uds%26source%3duds'
      item.thumbnail_uri.should == 'http://bks6.books.google.com/books?id=vUoCAgAACAAJ&printsec=frontcover&img=1&zoom=5&sig=ACfU3U1NHHhXuERH30Xfn0GC3A0BW5nMPg'
      item.published_year.should == 2006
      item.pages.should == 69
    end
  end
end

describe Google::Search::Item::Image do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('image-response')['responseData']['results'].first
      item = Google::Search::Item::Image.new hash
      item.title.should == 'foo_fighters.jpg'
      item.content.should == 'Not FBI Agents--Foo Fighters'
      item.id.should == 'IYlLzX-w4vX2AM'
      item.uri.should == 'http://tomdiaz.files.wordpress.com/2009/06/foo_fighters.jpg'
      item.context_uri.should == 'http://tomdiaz.wordpress.com/2009/06/'
      item.visible_uri.should == 'tomdiaz.wordpress.com'
      item.unescaped_uri.should == 'http://tomdiaz.files.wordpress.com/2009/06/foo_fighters.jpg'
      item.thumbnail_uri.should == 'http://images.google.com/images?q=tbn:IYlLzX-w4vX2AM:tomdiaz.files.wordpress.com/2009/06/foo_fighters.jpg'
    end
  end
end
