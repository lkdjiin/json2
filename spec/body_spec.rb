require 'spec_helper'

include Json2

describe Body do
  describe '.get' do
    it 'builds a body' do
      nodes = { "color": ["red", "green", "blue"],
                "value": ["#f00", "#0f0", "#00f"] }
      body = Body.get(nodes, nodes.keys, 3)
      expect(body).to eq fake_body
    end
  end
end

def fake_body
<<END
red,#f00
green,#0f0
blue,#00f
END
end
