module Google
  class Search
    class Defaults
  
      @@defaults = {}

      #--
      # Class method definitions,
      # adapt the defaults hash exposing
      # only get, set, update, delete and clear
      # methods.
      #++
      class << self;

        def get option
          @@defaults[option]
        end

        def set option, value
          @@defaults[option] = value
        end

        def update options = {}, &b
          @@defaults.update(options,&b)
        end

        def delete option
          @@defaults.delete option
        end

        def clear
          @@defaults.clear
        end

        #
        # @return a copy of the internal
        # state of this instance to allow
        # inspection.
        #
        def to_hash
          @@defaults.dup
        end

        #
        # Redefines method missing behavior
        # in order to interpret expressions like
        #
        # Google::Search::Defaults.property
        # Google::Search::Defaults.property = value
        #
        # respectively as
        #
        # Google::Search::Defaults.get :property
        # Google::Search::Defaults.set :property, value
        #
        #
        def method_missing(method_name, *args, &block)
          return get(method_name.to_sym) if block.nil? && args.length == 0
          return set($1.to_sym, args[0]) if block.nil? && args.length == 1 && method_name =~ /((\w|_|[0-9])+)=/
          super
        end

      end # class methods

    end # Defaults class
  end # Search class
end # Google module