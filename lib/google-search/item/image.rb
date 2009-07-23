
module Google
  class Search
    class Item
      class Image < self
        
        ##
        # Image id.
        
        attr_reader :id
        
        ##
        # Thumbnail image uri.
        
        attr_reader :thumbnail_uri

        ##
        # Visible uri.
        
        attr_reader :visible_uri
                
        ##
        # Context uri.
        
        attr_reader :context_uri
        
        ##
        # Unescaped uri.
        
        attr_reader :unescaped_uri
        
        ##
        # Initialize with _hash_.

        def initialize hash
          super
          @id = hash['imageId']
          @context_uri = hash['originalContextUrl']
          @visible_uri = hash['visibleUrl']
          @thumbnail_uri = hash['tbUrl']
          @unescaped_uri = hash['unescapedUrl']
        end
      end
    end
  end
end