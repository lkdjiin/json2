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

  describe '--path' do

    it 'is not set by default' do
      ARGV.replace([])
      opt = Option.new
      expect(opt[:with_path]).to eq false
    end

    it 'sets the option' do
      ARGV.replace(["--path=batters.batter"])
      opt = Option.new
      expect(opt[:with_path]).to eq true
    end

    it 'sets the path' do
      ARGV.replace(["--path=batters.batter"])
      opt = Option.new
      expect(opt[:path]).to eq 'batters.batter'
    end

    it 'raises an error if arg is missing' do
      ARGV.replace(['-p'])
      expect {
        Option.new
      }.to raise_error(OptionParser::MissingArgument)
    end

  end

end
