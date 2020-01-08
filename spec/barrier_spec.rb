require 'barrier'

describe Barrier do
  subject(:barrier) { described_class.new }
  let(:station_double) { double :station, zone: 1 }

  it 'should respond to station' do
    expect(barrier).to respond_to(:station)
  end

  describe '#assign_to' do
    it 'should assign a barrier to an instance of station' do
      barrier.assign_to(station_double)
      expect(barrier.station).to eq(station_double)
    end
  end

end
