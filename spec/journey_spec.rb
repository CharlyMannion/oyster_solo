require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:barrier_one) { double :barrier }
  let(:barrier_two) { double :barrier }
  let(:journey_history_double) { double :journey_history }
  # let(:oystercard) { double :oystercard, journey_history: journey_history_double, tap_in: barrier_one, tap_out: barrier_two }

  describe '#initalize' do
    it 'should have an empty entry barrier' do
      expect(journey.entry_barrier).to eq(nil)
    end
    it 'should have an empty exit barrier' do
      expect(journey.exit_barrier).to eq(nil)
    end
    it 'should have max_charge' do
      expect(journey.max_charge).to eq(MAX_CHARGE)
    end
  end

  describe '#commence_at' do
    it 'should set the entry barrier' do
      test_commence
      expect(journey.entry_barrier).to eq(barrier_one)
    end
  end

  describe '#terminate_at' do
    it 'should set the exit barrier' do
      test_terminate
      expect(journey.exit_barrier).to eq(barrier_two)
    end
  end

  describe '#complete?' do
    it 'should not be a complete journey before the exit station is set' do
      expect(journey.complete).to eq(false)
    end
  end
  it 'should be complete if there is an entry and exit station' do
    test_commence
    test_terminate
    expect(journey.complete).to eq(true)
  end

  private
  def test_commence
    journey.commence_at(barrier_one)
  end

  def test_terminate
    journey.terminate_at(barrier_two)
  end
end
