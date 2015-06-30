require 'spec_helper'

describe "colors-object.json as input" do

  it 'produces the CSV' do
    input = JSON.parse(File.open('spec/data/colors-object.json').read)
    json = Json2::Json2csv.new(input)
    expect(json.csv).to eq csv
  end

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
