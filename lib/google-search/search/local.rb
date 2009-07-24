
module Google
  class Search
    class Local < self
      
      #:nodoc:
      
      def initialize options = {}, &block
        super :local, options, &block
      end
    end
  end
end