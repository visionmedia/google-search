
module Google
  class Search
    
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
    
    def initialize type
      @type = type
    end
  end
end