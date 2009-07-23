
module Google
  class Search
    class Web < self
      
      #--
      # Constants
      #++
      
      SAFETY_LEVELS = :active, :moderate, :off
      
      ##
      # Safety level:
      #
      #   - :active
      #   - :moderate
      #   - :off
      #
      
      attr_accessor :safe
      
      ##
      # Weither or not to filter duplicate results.
      # Defaults to true.
      
      attr_accessor :filter
      
      #:nodoc:
      
      def initialize options = {}, &block
        @safe = options.delete :safe
        @filter = options.delete(:filter) || 1
        super :web, options, &block
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid safety level `#{safe}'" unless safe.nil? || SAFETY_LEVELS.include?(safe)
        super + [
          [:safe, safe],
          [ :filter, filter ? 1 : 0]]
      end
    end
  end
end