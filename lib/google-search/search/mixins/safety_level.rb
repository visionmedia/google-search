
module Google
  class Search
    module SafetyLevel
      
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
      
      #:nodoc:
      
      def initialize options = {}, &block
        @safe = options.delete :safety_level
        super
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid safety level `#{safety_level}'" unless safety_level.nil? || SAFETY_LEVELS.include?(safety_level)
        super + [[:safe, safety_level]]
      end
    end
  end
end