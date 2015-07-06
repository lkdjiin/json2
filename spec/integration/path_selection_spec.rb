require 'spec_helper'

describe "Path option" do

  it 'gets batters.batter' do
    options = { with_path: true, path: 'batters.batter' }
    input = JSON.parse(File.open('spec/data/products.json').read)
    csv_with_path = Json2::CsvWithHeader.new(input, options)

    expect(csv_with_path.output).to eq csv
  end

  it 'gets topping' do
    options = { with_path: true, path: 'topping' }
    input = JSON.parse(File.open('spec/data/products.json').read)
    csv_with_path = Json2::CsvWithHeader.new(input, options)

    expect(csv_with_path.output).to eq csv2

  end

  def csv
<<END
id,type
1001,Regular
1002,Chocolate
1003,Blueberry
1004,Devil's Food
END
  end

  def csv2
<<END
id,type
5001,None
5002,Glazed
5005,Sugar
5007,Powdered Sugar
5006,Chocolate with Sprinkles
5003,Chocolate
5004,Maple
END
  end

end
