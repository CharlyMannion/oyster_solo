require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:barrier_one) { double :barrier }
  let(:barrier_two) { double :barrier }

  describe '#initalize' do
    it 'should have an empty entry barrier' do
      expect(journey.entry_barrier).to eq(nil)
    end
    it 'should have an empty exit barrier' do
      expect(journey.exit_barrier).to eq(nil)
    end
  end

  describe '#commence_at' do
    it 'should set the entry barrier' do
      journey.commence_at(barrier_one)
      expect(journey.entry_barrier).to eq(barrier_one)
    end
  end

  describe '#terminate_at' do
    it 'should set the exit barrier' do
      journey.terminate_at(barrier_two)
      expect(journey.exit_barrier).to eq(barrier_two)
    end
  end

  describe '#complete?' do
    it 'should not be a complete journey before the exit station is set' do
      expect(journey.complete?).to eq(false)
    end
  end
  it 'should be complete if there is an entry and exit station' do
    journey.commence_at(barrier_one)
    journey.terminate_at(barrier_two)
    expect(journey.complete?).to eq(true)
  end
end
