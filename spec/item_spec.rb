
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
      hash['index'] = 0
      item = Google::Search::Item::Web.new hash
      item.index.should == 0
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

describe Google::Search::Item::Local do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('local-response')['responseData']['results'].first
      item = Google::Search::Item::Local.new hash
      item.city.should == 'San Francisco'
      item.type.should == 'local'
      item.region.should == 'CA'
      item.uri.should == 'http://www.google.com/local?source=uds&q=foo&sll=37.795279%2C-122.407451&latlng=37795279%2C-122407451%2C1909516875098392575&near=37.795279%2C-122.407451'
      item.directions_from_here_uri.should == 'http://www.google.com/maps?source=uds&saddr=852+Washington+St%2C+San+Francisco%2C+CA+%28Foo+Wah+Cheung%29+%4037.795279%2C-122.407451&iwstate1=dir%3Afrom'
      item.directions_to_here_uri.should == 'http://www.google.com/maps?source=uds&daddr=852+Washington+St%2C+San+Francisco%2C+CA+%28Foo+Wah+Cheung%29+%4037.795279%2C-122.407451&iwstate1=dir%3Ato'
      item.directions_uri.should == 'http://www.google.com/maps?source=uds&daddr=852+Washington+St%2C+San+Francisco%2C+CA+%28Foo+Wah+Cheung%29+%4037.795279%2C-122.407451&saddr'
      item.title.should == 'Foo Wah Cheung'
      item.accuracy.should == 8
      item.country.should == 'United States'
      item.max_age.should == 604800
      item.thumbnail_uri.should == 'http://mt.google.com/mapdata?cc=us&tstyp=5&Point=b&Point.latitude_e6=37795279&Point.longitude_e6=-122407451&Point.iconid=15&Point=e&w=150&h=100&zl=4'
      item.long.should == -122.407451
      item.street_address.should == '852 Washington St'
      item.content.should == ''
      item.lat.should == 37.795279
      item.viewport_mode.should == 'computed'
      item.phone_numbers.should == ['(415) 391-4067']
      item.address_lines.should == ['852 Washington St', 'San Francisco, CA']
     end
  end
end

describe Google::Search::Item::Patent do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('patent-response')['responseData']['results'].first
      item = Google::Search::Item::Patent.new hash
      item.title.should == 'SZE-FOO CHIEN'
      item.id.should == 3468158
      item.content.should include('METHOD OF AND APPARATUS FOR DETERMINING RH')
      item.assignee.should == ''
      item.application_date.should be_a(DateTime)
      item.uri.should == 'http://www.google.com/patents/about%3Fid%3DGDMdAAAAEBAJ%26dq%3Dfoo%26client%3Dinternal-uds%26source%3duds'
      item.thumbnail_uri.should == 'http://bks9.books.google.com/patents?id=GDMdAAAAEBAJ&printsec=drawing&img=1&zoom=1&sig=ACfU3U10b3w-4hMfKTEykPmtqnoObaLhaA'
      item.unescaped_uri.should == 'http://www.google.com/patents/about?id=GDMdAAAAEBAJ&dq=foo&client=internal-uds&source=uds'
      item.status.should == 'issued'
    end
  end
end

describe Google::Search::Item::News do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('news-response')['responseData']['results'].first
      item = Google::Search::Item::News.new hash
      item.title.should include('TICKET TO DINING')
      item.language.should == 'en'
      item.uri.should == 'http%3A%2F%2Fwww.montgomerynews.com%2Farticles%2F2009%2F07%2F22%2Fentertainment%2Fdoc4a672746b0941650009917.txt'
      item.published.should be_a(DateTime)
      item.publisher.should == 'Montgomery Newspapers'
      item.content.should include('After all, it was')
      item.redirect_uri.should == 'http://news.google.com/news/url?sa=T&ct=us/0-0-0&fd=S&url=http://www.montgomerynews.com/articles/2009/07/22/entertainment/doc4a672746b0941650009917.txt&cid=0&ei=4aFnSpnxK474rQPutNHRAQ&usg=AFQjCNGsuTniL5DY24lNJ8qy204ZWjQoKA'
      item.unescaped_uri.should == 'http://www.montgomerynews.com/articles/2009/07/22/entertainment/doc4a672746b0941650009917.txt'
      item.location.should == 'Fort Washington,PA,USA'
    end
  end
end

describe Google::Search::Item::Image do
  describe "#initialize" do
    it "should populate attributes" do
      hash = json_fixture('image-response')['responseData']['results'].first
      item = Google::Search::Item::Image.new hash
      item.id.should == 'IYlLzX-w4vX2AM'
      item.title.should == 'foo_fighters.jpg'
      item.uri.should == 'http://tomdiaz.files.wordpress.com/2009/06/foo_fighters.jpg'
      item.content.should include('Not FBI Agents')
      item.context_uri.should == 'http://tomdiaz.wordpress.com/2009/06/'
      item.width.should == 883
      item.height.should == 891
      item.thumbnail_uri.should == 'http://images.google.com/images?q=tbn:IYlLzX-w4vX2AM:tomdiaz.files.wordpress.com/2009/06/foo_fighters.jpg'
      item.thumbnail_width.should == 145
      item.thumbnail_height.should == 146
    end
  end
end
