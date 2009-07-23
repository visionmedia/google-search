
module Google
  class Search
    class Item
      class Video < self
        
        ##
        # Rating float.
        
        attr_reader :rating
        
        ##
        # Video type.
        
        attr_reader :type
        
        ##
        # Publisher.
        
        attr_reader :publisher
        
        ##
        # Published DateTime.
        
        attr_reader :published
        
        ##
        # Thumbnail image uri.
        
        attr_reader :thumbnail_uri
        
        ##
        # Duration in seconds.
        
        attr_reader :duration
        
        ##
        # Initialize with _hash_.

        def initialize hash
          super
          @rating = hash['rating'].to_f
          @type = hash['videoType']
          @publisher = hash['publisher']
          @published = DateTime.parse hash['published']
          @thumbnail_uri = hash['tbUrl']
          @duration = hash['duration'].to_i
        end
      end
    end
  end
end