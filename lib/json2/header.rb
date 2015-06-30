module Json2

  # Build a csv header.
  class Header

    def self.get(keys)
      new(keys).get
    end

    def initialize(keys)
      @header = []
      @keys = keys
    end

    def get
      @keys.each do |key|
        short_name = key.split('.').last
        @header << (@header.include?(short_name) ? key : short_name)
      end
      @header.join(',') + "\n"
    end
  end

end
