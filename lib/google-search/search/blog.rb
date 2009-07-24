
module Google
  class Search
    class Blog < self
      
      #--
      # Constants
      #++
      
      ORDER_BY = :relevance, :date
      
      ##
      # Order by. Defaults to :relevance
      #
      #  - :relevance
      #  - :date
      #
      
      attr_reader :order_by
      
      #:nodoc:
      
      def initialize options = {}, &block
        @order_by = options.delete :order_by
        super :blog, options, &block
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid order `#{order_by}'" unless order_by.nil? || ORDER_BY.include?(order_by)
        super + [[:scoring, order_by ? 'd' : nil]]
      end
    end
  end
end