
module Google
  class Search
    class News < self
      
      #--
      # Constants
      #++
      
      ORDER_BY = :relevance, :date
      TOPICS = :headlines, :world, :business, :nation, :science, 
               :elections, :politics, :entertainment, :sports, :health
      
      ##
      # Order by. Defaults to :relevance
      #
      #  - :relevance
      #  - :date
      #
      
      attr_reader :order_by
      
      ##
      # Relative to city, state, province,
      # zipcode, etc.
      
      attr_reader :relative_to
      
      ##
      # Topic:
      #
      #  - :headlines
      #  - :world
      #  - :business
      #  - :nation
      #  - :science
      #  - :elections
      #  - :politics
      #  - :entertainment
      #  - :sports
      #  - :health
      #
      
      attr_reader :topic
      
      #:nodoc:
      
      def initialize options = {}, &block
        @order_by = options.delete :order_by
        @relative_to = options.delete :relative_to
        super :news, options, &block
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid order `#{order_by}'" unless order_by.nil? || ORDER_BY.include?(order_by)
        raise Error, "invalid topic `#{topic}'" unless topic.nil? || TOPICS.include?(topic)
        super + [
          [:scoring, order_by ? 'd' : nil],
          [:geo, relative_to]
          ]
      end
    end
  end
end