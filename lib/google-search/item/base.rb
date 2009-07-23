
module Google
  class Search
    class Item
      
      ##
      # Unformatted page title.
      
      attr_reader :title
      
      ##
      # Absolute uri.
      
      attr_reader :uri
      
      ##
      # Contents.
      
      attr_reader :content
      
      ##
      # Initialize with _hash_.

      def initialize hash
        @title = hash['titleNoFormatting']
        @uri = hash['url'] || hash['postUrl']
        @content = hash['content']
      end
      
      ##
      # Return class for _google_class_ string formatted
      # as 'GwebSearch', 'GbookSearch', etc.
      
      def self.class_for google_class
        case google_class
        when 'GwebSearch'    ; Web
        when 'GlocalSearch'  ; Local
        when 'GbookSearch'   ; Book
        when 'GimageSearch'  ; Image
        when 'GvideoSearch'  ; Video
        when 'GpatentSearch' ; Patent
        when 'GnewsSearch'   ; News
        when 'GblogSearch'   ; Blog
        end
      end
    end
  end
end
