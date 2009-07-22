
module Google
  class Search
    class Response
      attr_accessor :raw
      attr_reader :hash
      attr_reader :items
      
      def initialize hash
        @hash = hash
        @items = []
        if valid?
          @items = hash['responseData']['results'].map do |result|
            Google::Search::Item.new result
          end
        end
      end
      
      def valid?
        hash['responseStatus'] == 200
      end
    end
  end
end