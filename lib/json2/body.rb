module Json2

  # Build a csv body.
  class Body

    def self.get(nodes, keys, column_size)
      new(nodes, keys, column_size).get
    end

    # Creates a new Body instance.
    #
    # nodes       - A Hash representing all columns. The key is the
    #               Symbol column's header and the value is an Array
    #               full of column's values.
    # keys        - An Array of Symbol header's column. Why passing the
    #               column's names while they are contained in `nodes`?
    #               This is because we want the header's names in that
    #               particular order given by `keys`, we can't rely on
    #               the order of the *Hash* `nodes`.
    # column_size - The Fixnum size of a column. TODO I think this
    #               parameter isn't needed.
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
