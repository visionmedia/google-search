
module Google
  class Search
    class News < self
      
      #--
      # Mixins
      #++
      
      include OrderBy
      
      #--
      # Constants
      #++
      
      TOPICS = :headlines, :world, :business, :nation, :science, 
               :elections, :politics, :entertainment, :sports, :health

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
      
      ##
      # Edition, such as :us, :uk, :fr_ca, etc.
      
      attr_reader :edition
      
      #:nodoc:
      
      def initialize options = {}, &block
        @relative_to = options.delete :relative_to
        @edition = options.delete :edition
        super :news, options, &block
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid topic `#{topic}'" unless topic.nil? || TOPICS.include?(topic)
        super + [
          [:geo, relative_to],
          [:topic, topic],
          [:ned, edition]
          ]
      end
    end
  end
end