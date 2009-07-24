
require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::News do
  before :each do
    @search = Google::Search::News.new :query => 'foo'  
  end
  
  describe "#get_uri" do
    describe "relative_to" do
      it "should set relative to geo" do
        @search.relative_to = 'Edmonton Alberta'
        @search.get_uri.should_not include('geo=Edmonton%20Alberta')
      end
    end
  end
end

__END__

       [:geo, relative_to],
        [:topic, topic],
        [:ned, edition]