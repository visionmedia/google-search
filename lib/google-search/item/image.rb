
module Google
  class Search
    class Item
      class Image < self
        
        ##
        # Image id.
        
        attr_reader :id
        
        ##
        # Context uri.
        
        attr_reader :context_uri
        
        ##
        # Initialize with _hash_.

        def initialize hash
          super
          @id = hash['imageId']
          @context_uri = hash['originalContextUrl']
        end
      end
    end
  end
end