require 'identifiers/handle'

RSpec.describe Identifiers::Handle do
  it 'extracts a Handle' do
    str = 'http://hdl.handle.net/10149/596901'

    expect(described_class.extract(str)).to contain_exactly('10149/596901')
  end

  it 'extracts another Handle' do
    str = 'http://hdl.handle.net/2117/83545it.ly/1UtXnTW'

    expect(described_class.extract(str)).to contain_exactly('2117/83545it.ly/1UtXnTW')
  end
end
