
module Google
  class Search
    class Book < self
      
      #:nodoc:
      
      def initialize options = {}, &block
        super :book, options, &block
      end
    end
  end
end