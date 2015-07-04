module Json2

  # Turn a Json input into a Csv output with a header.
  class CsvWithHeader

    def initialize(input)
      @input = input
      @names_stack = []
      @nodes = Hash.new {|hash, key| hash[key] = [] }
      process_input
      @column_size = @nodes.values.map {|node| node.size }.max
      @keys = @nodes.keys.select {|key| @nodes[key].size == @column_size }
    end

    def output
      Header.get(@keys) + Body.get(@nodes, @keys, @column_size)
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
        warn('Error, try with json2 --without-header')
        exit 99
      end
    end

    def process_key(object)
      case object
      when Array then process_array(object)
      when Hash then process_keys(object)
      else
        @nodes[@names_stack.join('.')] <<= object
      end
    end

    def process_array(object)
      object.each {|element| process_keys(element) }
    end

  end

end
