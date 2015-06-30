require 'spec_helper'

include Json2

describe Header do

  describe '.get' do
    it 'simplify the header' do
      header = Header.get(['a.b.foo', 'a.b.bar', 'a.b.baz'])
      expect(header).to eq "foo,bar,baz\n"
    end

    it 'keeps names unique' do
      header = Header.get(['a.b.foo', 'a.b.bar', 'c.d.foo'])
      expect(header).to eq "foo,bar,c.d.foo\n"
    end
  end
end
