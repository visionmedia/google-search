
module Google
  class Search
    class Blog < self
      
      #--
      # Mixins
      #++
      
      include OrderBy
      
      #:nodoc:
      
      def initialize options = {}, &block
        super :blog, options, &block
      end
    end
  end
end