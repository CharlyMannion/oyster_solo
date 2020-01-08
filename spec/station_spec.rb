require 'station'

describe Station do
  subject(:station) { described_class.new }
  let(:barrier_class_double) { double :barrier_class }
  let(:barrier) { double :barrier }

  describe 'initialize' do
    it 'should have a zone' do
      expect(subject.zone).to eq(nil)
    end
    it 'should have no barriers' do
      expect(subject.barriers).to eq([])
    end
  end

  describe '#zone' do
    it 'should be possible to change the zone' do
      subject.zone = 1
      expect(subject.zone).to eq(1)
    end
  end

  describe '#add_barrier' do
    it 'should be possible to add barriers to the station' do
      subject.add_barrier
      expect(subject.barriers.first).to be_a Barrier
    end
  end
end
