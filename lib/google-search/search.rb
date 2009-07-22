
module Google
  class Search
    
    ##
    # Version. Defaults to 1.0
    
    attr_accessor :version
    
    ##
    # Offset. Defaults to 0
    
    attr_accessor :offset
    
    ##
    # Language. Defaults to :en
    
    attr_accessor :lang
    
    ##
    # Query. Defaults to nil
    
    attr_accessor :query
    
    ##
    # API Key.
    
    attr_accessor :api_key
    
    ##
    # Size. Defaults to :small
    #
    #  - :small = 4
    #  - :large = 8
    #
    
    attr_accessor :size
    
    ##
    # Type symbol:
    #
    #   - :local
    #   - :web
    #   - :video
    #   - :blog
    #   - :news
    #   - :image
    #   - :book
    #   - :patent
    #
    
    attr_reader :type
    
    ##
    # Initialize search _type_ with _options_.
    
    def initialize type, options = {}
      @type = type
      @version = options[:version] || 1.0
      @offset = options[:offset] || 0
      @size = options[:size] || :small
      @lang = options[:lang] || :en
      @query = options[:query]
      @api_key = options[:api_key]
    end
  end
end