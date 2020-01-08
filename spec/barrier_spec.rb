require 'barrier'

describe Barrier do
  subject(:barrier) { described_class.new }

  it 'should respond to station' do
    expect(barrier).to respond_to(:station)
  end

end
