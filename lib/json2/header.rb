module Json2

  # Build a csv header.
  class Header

    # Get the header of a Csv file.
    #
    # For a description of the parameter(s) see Header#initialize.
    #
    # Returns the String header, that is a single line with comma
    # separated column's name.
    def self.get(keys)
      new(keys).get
    end

    # Creates a new Header instance.
    #
    # keys - A Hash of String names of variable/column.
    def initialize(keys)
      @header = []
      @keys = keys
    end

    # Get the header of a Csv file. See also Header.get.
    #
    # Returns the String header.
    def get
      @keys.each do |key|
        short_name = key.split('.').last
        @header << (@header.include?(short_name) ? key : short_name)
      end
      @header.join(',') + "\n"
    end
  end

end
