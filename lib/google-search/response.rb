
module Google
  class Search
    class Response
      attr_reader :data
      
      def initialize hash
        @data = hash
      end
      
      def valid?
        data['responseStatus'] == 200
      end
    end
  end
end