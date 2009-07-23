
require 'json'
require 'open-uri'

module Google
  class Search
    
    #--
    # Mixins
    #++
    
    include Enumerable
    
    #--
    # Constants
    #++
    
    URI = 'http://www.google.com/uds'
    
    ##
    # Version. Defaults to 1.0
    
    attr_accessor :version
    
    ##
    # Offset. Defaults to 0
    
    attr_accessor :offset
    
    ##
    # Language. Defaults to :en
    
    attr_accessor :language
    
    ##
    # Weither or not a search request has been sent.
    
    attr_accessor :sent
    
    ##
    # Query. Defaults to nil
    
    attr_accessor :query
    
    ##
    # API Key. Defaults to :notsupplied
    
    attr_accessor :api_key
    
    ##
    # Size. Defaults to :large
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
    
    attr_accessor :type
    
    ##
    # Initialize search _type_ with _options_.
    
    def initialize type, options = {}
      @type = type
      @version = options[:version] || 1.0
      @offset = options[:offset] || 0
      @size = options[:size] || :large
      @language = options[:language] || :en
      @query = options[:query]
      @api_key = options[:api_key] || :notsupplied
    end
    
    ##
    # Iterate each item with _block_.
    
    def each_item &block
      response = self.next.response
      if response.valid?
        response.each { |item| yield item }
        each_item &block
      end
    end
    alias :each :each_item
    
    ##
    # Return uri.
    
    def get_uri
      URI + "/G#{@type}Search?" + [
        [:start, offset],
        [:rsz, size],
        [:hl, language],
        [:key, api_key],
        [:v, version],
        [:q, query]
      ].map { |key, value| "#{key}=#{value}" }.join('&')
    end
    
    ##
    # Prepare for next request.
    
    def next
      @offset += Search.size_for(size) if sent
      self
    end
    
    ##
    # Return raw JSON response string.
    
    def get_raw
      @sent = true
      open(get_uri).read
    end
    
    ##
    # Return hash parsed from the raw JSON response.
    
    def get_hash
      Search.json_decode get_raw
    end
    
    ##
    # Return Response object wrapping the JSON
    # response hash.
    
    def get_response
      raw = get_raw
      hash = Search.json_decode raw
      hash['responseSize'] = size
      response = Response.new hash
      response.raw = raw
      response
    end
    alias :response :get_response
    
    ##
    # Return int for size _sym_.
    
    def self.size_for sym
      { :small => 4,
        :large => 8 }[sym]
    end
    
    ##
    # Decode JSON _string_.
    
    def self.json_decode string
      JSON.parse string
    end
    
  end
end