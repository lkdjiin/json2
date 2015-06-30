module Json2

  # Build a csv body.
  class Body

    def self.get(nodes, keys, column_size)
      new(nodes, keys, column_size).get
    end

    def initialize(nodes, keys, column_size)
      @nodes = nodes
      @column_size = column_size
      @keys = keys
      @body = ''
    end

    def get
      (0...@column_size).each {|observation| process_line(observation) }
      @body
    end

    private

    def process_line(observation)
      line = []
      @keys.each {|key| line << @nodes[key][observation] }
      @body += line.join(',') + "\n"
    end

  end

end
