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
      if @input.respond_to?(:each_key)
        process_keys(@input)
      else
        process_array(@input)
      end
    end

    def process_keys(object)
      if object.respond_to?(:each_key)
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
      when ~:each_key then process_keys(object)
      when ~:at then process_array(object)
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
