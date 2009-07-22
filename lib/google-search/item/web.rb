
module Google
  class Search
    class Item
      class Web < Item
        
        ##
        # Unformatted page title.
        
        attr_reader :title
        
        ##
        # Absolute uri.
        
        attr_reader :uri
        
        ##
        # Cached uri.
        
        attr_reader :cached_uri
        
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
end