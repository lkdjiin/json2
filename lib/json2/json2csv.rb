module Json2

  # Take a json input, as a Hash and output a csv, as a String.
  class Json2csv

    def initialize(input, with_header: true)
      @options = { with_header: with_header }
      @input = input
      @names_stack = []
      @csv_without_header = ''
      @nodes = Hash.new {|hash, key| hash[key] = [] }
      process_input
      @column_size = @nodes.values.map {|node| node.size }.max
      @keys = @nodes.keys.select {|key| @nodes[key].size == @column_size }
    end

    def csv
      if @options[:with_header]
        Header.get(@keys) + Body.get(@nodes, @keys, @column_size)
      else
        @csv_without_header
      end
    end

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
        if @options[:with_header]
          @nodes[@names_stack.join('.')] <<= object
        else
          exit 99
        end
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
      @csv_without_header += @names_stack.join(',') + "\n"
      @names_stack.pop
    end

  end

end
