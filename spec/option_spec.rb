require 'spec_helper'

include Json2

describe Option do

  describe '--without-header' do

    it 'sets the option' do
      ARGV.replace(['--without-header'])
      opt = Option.new
      expect(opt[:without_header]).to eq true
    end

  end

end
