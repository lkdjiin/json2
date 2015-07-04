module Json2

  class Option

    def initialize
      @options = { without_header: false }

      optparse = OptionParser.new do|opts|
        opts.on( '-w', '--without-header', 'Output csv without a header' ) do
          @options[:without_header] = true
        end
        opts.on( '-v', '--version', 'Print version number and exit' ) do
          @options[:version] = true
        end
        opts.on( '-h', '--help', 'Display this screen' ) do
          puts opts
          exit
        end
      end

      begin
        optparse.parse!
      rescue OptionParser::InvalidOption => e
        puts e.to_s
        exit 1
      end

      print_version if @options[:version]
    end

    def [](key)
      @options[key]
    end

    private

    def print_version
      puts "Json2 version #{VERSION}"
      exit
    end

  end

end
