module Json2

  # Turn a Json input into a Csv output without header.
  class CsvWithoutHeader

    def initialize(input)
      @input = input
      @names_stack = []
      @output = ''
      process_input
    end

    attr_reader :output

    private

    def process_input
      if @input.is_a?(Array)
        process_array(@input)
      else
        process_keys(@input)
      end
    end

    def process_keys(object)
      case object
      when Array, Hash
        object.each_key do |key|
          @names_stack.push(key)
          process_key(object[key])
          @names_stack.pop
        end
      else
        record_line(object)
      end
    end

    def process_key(object)
      case object
      when Array then process_array(object)
      when Hash then process_keys(object)
      else
        warn('Error, try without using --without-header')
        exit 99
      end
    end

    def process_array(object)
      if object.empty?
        record_line('')
      else
        object.each {|element| process_keys(element) }
      end
    end

    def record_line(element)
      @names_stack.push(element)
      @output += @names_stack.join(',') + "\n"
      @names_stack.pop
    end

  end

end
