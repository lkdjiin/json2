require 'spec_helper'

describe CsvWithHeader do

  describe 'when the header is unknown' do

    before { $stderr.reopen("/dev/null", "w") }
    after { $stderr = STDERR }

    it 'exits' do
      expect {
        Json2::CsvWithHeader.new(input)
      }.to raise_error(SystemExit)
    end

    it 'exits with code 99' do
      begin
        Json2::CsvWithHeader.new(input)
      rescue SystemExit => e
        expect(e.status).to eq 99
      end
    end

    xit 'outputs a message' do
      expect {
        Json2::CsvWithHeader.new(input)
      }.to output(/try with json2 --without-header/i).to_stderr.and.raise_error
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
