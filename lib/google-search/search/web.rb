
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
      
      attr_accessor :safety_level
      
      ##
      # Weither or not to filter duplicate results.
      # Defaults to true.
      
      attr_accessor :filter
      
      #:nodoc:
      
      def initialize options = {}, &block
        @safe = options.delete :safety_level
        @filter = options.delete(:filter) || 1
        super :web, options, &block
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid safety level `#{safety_level}'" unless safety_level.nil? || SAFETY_LEVELS.include?(safety_level)
        super + [
          [:safe, safety_level],
          [:filter, filter ? 1 : 0]]
      end
    end
  end
end