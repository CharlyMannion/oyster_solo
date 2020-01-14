require 'station'

describe Station do
  subject(:station) { described_class.new }
  let(:barrier_class_double) { double :barrier_class }
  let(:barrier) { double :barrier }

  describe 'initialize' do
    it 'should have a zone' do
      expect(subject.zone).to eq(nil)
    end
  end

  describe '#zone' do
    it 'should be possible to change the zone' do
      subject.zone = 1
      expect(subject.zone).to eq(1)
    end
  end

  describe '#name' do
    it 'should be given a name' do
      subject.name = :dalston
      expect(subject.name).to eq(:dalston)
    end
  end
end
