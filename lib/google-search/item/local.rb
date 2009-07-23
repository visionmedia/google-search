
module Google
  class Search
    class Item
      class Local < self
        
        attr_reader :country
        
        attr_reader :region
        
        attr_reader :city
        
        attr_reader :type
        
        attr_reader :accuracy
        
        attr_reader :max_age
        
        attr_reader :directions_uri
        
        attr_reader :directions_to_here_uri
        
        attr_reader :directions_from_here_uri
        
        attr_reader :static_map_uri
        
        attr_reader :long
        
        attr_reader :lat
        
        attr_reader :viewport_mode
        
        attr_reader :phone_numbers
        
        attr_reader :street_address
        
        attr_reader :address_lines
        
        ##
        # Initialize with _hash_.

        def initialize hash
          super
          @country = hash['country']
          @region = hash['region']
          @city = hash['city']
          @type = hash['listingType']
          @accuracy = hash['accuracy'].to_i
          @max_age = hash['maxAge']
          @directions_uri = hash['ddUrl']
          @directions_to_here_uri = hash['ddUrlToHere']
          @directions_from_here_uri = hash['ddUrlFromHere']
          @static_map_uri = hash['staticMapUrl']
          @long = hash['lng'].to_f
          @lat = hash['lat'].to_f
          @viewport_mode = hash['viewportmode']
          @phone_numbers = hash['phoneNumbers'].map { |phone| phone['number'] }
          @street_address = hash['streetAddress']
          @address_lines = hash['addressLines']
        end
      end
    end
  end
end