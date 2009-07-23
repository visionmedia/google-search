
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
      # Unescaped uri.
      
      attr_reader :unescaped_uri

      ##
      # Visible uri.
      
      attr_reader :visible_uri
      
      ##
      # Thumbnail uri.
      
      attr_reader :thumbnail_uri
      
      ##
      # Contents.
      
      attr_reader :content
      
      ##
      # Initialize with _hash_.

      def initialize hash
        @title = hash['titleNoFormatting'] || hash['title']
        @uri = hash['url'] || hash['postUrl']
        @content = hash['contentNoFormatting'] || hash['content']
        @unescaped_uri = hash['unescapedUrl']
        @thumbnail_uri = hash['tbUrl']
        @visible_uri = hash['visibleUrl']
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
