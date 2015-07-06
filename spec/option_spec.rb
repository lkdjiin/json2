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

  describe '--version' do
    it 'exits' do
      ARGV.replace(['-v'])
      expect { Option.new }.to raise_error(SystemExit)
    end
  end

end
