require 'spec_helper'

describe "colors-array.json as input" do

  it 'produces the CSV' do
    input = JSON.parse(File.open('spec/data/colors-array.json').read)
    csv_with_header = Json2::CsvWithHeader.new(input)
    expect(csv_with_header.output).to eq csv
  end

  def csv
<<END
color,value
red,#f00
green,#0f0
blue,#00f
cyan,#0ff
magenta,#f0f
yellow,#ff0
black,#000
END
  end

end

