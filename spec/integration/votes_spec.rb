require 'spec_helper'

describe "votes.json as input" do

  it 'produces the CSV' do
    input = JSON.parse(File.open('spec/data/votes.json').read)
    csv_without_header = Json2::CsvWithoutHeader.new(input)
    expect(csv_without_header.output).to eq csv
  end

  def csv
<<END
Nom du parti,Abstention,Jean
Nom du parti,Non-votant,
Nom du parti,Contre,Alice
Nom du parti,Contre,Georges
Nom du parti,Pour,Julie
END
  end

end
