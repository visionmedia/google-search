
module Google
  class Search
    class Item
      attr_accessor :title, :uri, :cached_uri, :visible_uri, :unescaped_uri, :description
      
      def initialize hash
        @title = hash[:title]
        @uri = hash[:url]
        @cached_uri = hash[:cachedUrl]
        @visibile_uri = hash[:visibleUrl]
        @unescaped_uri = hash[:unescapedUrl]
        @description = hash[:content]
      end
    end
  end
end