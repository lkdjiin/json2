module Json2

  # Take a json input, as a Hash and output a csv, as a String.
  class Json2csv

    def initialize(input)
      @input = input
      @names_stack = []
      @nodes = Hash.new {|hash, key| hash[key] = [] }
      process_input
      @column_size = @nodes.values.map {|node| node.size }.max
      @keys = @nodes.keys.select {|key| @nodes[key].size == @column_size }
    end

    def csv
      Header.get(@keys) + Body.get(@nodes, @keys, @column_size)
    end

    private

    def process_input
      if @input.class.name == 'Array'
        process_array(@input)
      else
        process_keys(@input)
      end
    end

    def process_keys(hash)
      hash.each_key do |key|
        @names_stack.push(key)
        process_key(hash[key], key)
        @names_stack.pop
      end
    end

    def process_key(object, key)
      case object.class.name
      when "Array" then process_array(object)
      when "Hash" then process_keys(object)
      when "String" then @nodes[@names_stack.join('.')] <<= object
      else
        error(object, key)
      end
    end

    def process_array(object)
      object.each {|element| process_keys(element) }
    end

    def error(object, key)
      puts "Error, don't know what to do with #{key}:#{object.class}"
      exit 2
    end

  end

end
