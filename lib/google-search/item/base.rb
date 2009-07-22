
module Google
  class Search
    class Item
      
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