
module Google
  class Search
    class Item
      class Web < self
        
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
        # Initialize with _hash_.

        def initialize hash
          super
          @cache_uri = hash['cacheUrl']
          @visible_uri = hash['visibleUrl']
          @unescaped_uri = hash['unescapedUrl']
        end
      end
    end
  end
end