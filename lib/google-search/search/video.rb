
module Google
  class Search
    class Video < self
      
      #--
      # Mixins
      #++
      
      include OrderBy
      #:nodoc:
      
      def initialize options = {}, &block
        super :video, options, &block
      end
    end
  end
end