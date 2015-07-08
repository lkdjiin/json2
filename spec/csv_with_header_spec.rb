require 'spec_helper'

include Json2

describe CsvWithHeader do

  describe 'when the header is unknown' do

    it 'exits' do
      expect {
        CsvWithHeader.new(input)
      }.to raise_error(SystemExit)
    end

    it 'exits with right code' do
      begin
        CsvWithHeader.new(input)
      rescue SystemExit => e
        expect(e.status).to eq 98
      end
    end

  end

  def input
    {
      "Nom du parti" => {
        "Abstention" => [
           "Foo1 Bar1"
        ],
        "Non-votant" => [],
          "Contre" => [
            "Foo2 Bar2",
            "Foo3 Bar3"
          ],
        "Pour" => [
          "Foo4 Bar4"
        ]
      }
    }
  end

end
