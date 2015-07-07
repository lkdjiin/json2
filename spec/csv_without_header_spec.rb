require 'spec_helper'

include Json2

describe CsvWithoutHeader do

  describe 'When the header is known' do

    it 'exits' do
      expect { CsvWithoutHeader.new(input) }.to raise_error(SystemExit)
    end

    def input
      {
        "red"   => "#f00",
        "green" => "#0f0",
      }
    end

  end

end
