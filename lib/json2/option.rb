module Json2

  # Process command line switches.
  class Option

    def initialize
      @options = { without_header: false, with_path: false }

      optparse = OptionParser.new {|opts| parse(opts) }

      begin
        optparse.parse!
      rescue OptionParser::InvalidOption => exception
        puts exception.to_s
        exit 1
      end

      print_version if @options[:version]
    end

    def [](key)
      @options[key]
    end

    def parse(opts)
      opts.on('-w', '--without-header', 'Output csv without a header') do
        @options[:without_header] = true
      end
      opts.on('-p', '--path PATH', 'Extract only this path') do |arg|
        @options[:with_path] = true
        @options[:path] = arg
      end
      opts.on('-v', '--version', 'Print version number and exit') do
        @options[:version] = true
      end
      opts.on('-h', '--help', 'Display this screen') do
        puts opts
        exit
      end
    end

    private

    def print_version
      puts "Json2 version #{VERSION}"
      exit
    end

  end

end
