
module Google
  class Search
    class Item
      class Web < self
        
        ##
        # Unformatted page title.
        
        attr_reader :title
        
        ##
        # Absolute uri.
        
        attr_reader :uri
        
        ##
        # Cached uri.
        
        attr_reader :cache_uri
        
        ##
        # Visible uri.
        
        attr_reader :visible_uri
        
        ##
        # Unescaped uri.
        
        attr_reader :unescaped_uri
        
        ##
        # Contents.
        
        attr_reader :contents
        
        ##
        # Initialize with _hash_.

        def initialize hash
          @title = hash['title']
          @uri = hash['url']
          @cache_uri = hash['cacheUrl']
          @visible_uri = hash['visibleUrl']
          @unescaped_uri = hash['unescapedUrl']
          @contents = hash['content']
        end
      end
    end
  end
end