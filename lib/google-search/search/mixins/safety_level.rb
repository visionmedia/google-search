
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
        validate(:safety_level) { |level| level.nil? || SAFETY_LEVELS.include?(level) }
        super + [[:safe, safety_level]]
      end
    end
  end
end