
module Google
  class Search
    class Response
      
      ##
      # Raw JSON string.
      
      attr_accessor :raw
      
      ##
      # Hash parsed from raw JSON string.
      
      attr_reader :hash
      
      ##
      # Items populated by the JSON hash.
      
      attr_reader :items
      
      ##
      # Initialize with _hash_.
      
      def initialize hash
        @hash = hash
        @items = []
        if valid?
          @items = @hash['responseData']['results'].map do |result|
            Google::Search::Item.new result
          end
        end
      end
      
      ##
      # Check if the response is valid.
      
      def valid?
        @hash['responseStatus'] == 200
      end
    end
  end
end