
module Google
  class Search
    class Image < self
      
      #--
      # Mixins
      #++
      
      include SafetyLevel
      
      #--
      # Constants
      #++
      
      SIZES = :icon, :small, :medium, :large, :xlarge, :xxlarge, :huge
      TYPES = :face, :photo, :clipart, :lineart
      EXTENSIONS = :jpg, :png, :gif, :bmp
      
      ##
      # Image size:
      #
      #  - :icon
      #  - :small
      #  - :medium
      #  - :large
      #  - :xlarge
      #  - :xxlarge
      #  - :huge
      #
      
      attr_accessor :size
      
      ##
      # Image type:
      #
      #  - :face
      #  - :photo
      #  - :clipart
      #  - :lineart
      #
      
      attr_accessor :type
      
      ##
      # File type:
      #
      #  - :jpg
      #  - :gif
      #  - :png
      #  - :bmp
      #
      
      attr_accessor :file_type
      
      ##
      # Image color.
      
      attr_accessor :color
      
      ##
      # Specific uri to fetch images from.
      
      attr_accessor :uri
      
      #:nodoc:
      
      def initialize options = {}, &block
        @size = options.delete :size
        @color = options.delete :color
        @type = options.delete :type
        @file_type = options.delete :file_type
        super
      end
      
      #:nodoc:
      
      def get_uri_params
        raise Error, "invalid image size `#{size}'" unless SIZES.include? size
        raise Error, "invalid file type `#{file_type}'" unless EXTENSIONS.include? file_type
        raise Error, "invalid image type `#{type}'" unless TYPES.include? type
        super + [
          [:safe, safety_level],
          [:imgsz, size],
          [:imgcolor, color],
          [:imgtype, type],
          [:as_filetype, file_type],
          [:as_sitesearch, ui]
          ]
      end
    end
  end
end