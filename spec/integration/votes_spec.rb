require 'spec_helper'

describe "votes.json as input" do

  it 'produces the CSV' do
    input = JSON.parse(File.open('spec/data/votes.json').read)
    json = Json2::Json2csv.new(input, with_header: false)
    expect(json.csv).to eq csv
  end

  def csv
<<END
Nom du parti,Abstention,Foo1 Bar1
Nom du parti,Non-votant,
Nom du parti,Contre,Foo2 Bar2
Nom du parti,Contre,Foo3 Bar3
Nom du parti,Pour,Foo4 Bar4
END
  end

end
