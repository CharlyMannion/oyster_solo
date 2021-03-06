require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:barrier_one) { double :barrier, station: station_double }
  let(:barrier_two) { double :barrier, station: station_double }
  let(:station_double) { double :station, zone: 1 }
  let(:station_dbl_two) { double :station, zone: 2}
  let(:barrier_three) { double :barrier, station: station_dbl_two }
  let(:journey_history_double) { double :journey_history }
  # let(:oystercard) { double :oystercard, journey_history: journey_history_double, tap_in: barrier_one, tap_out: barrier_two }

  SAME_ZONE_COST = 2
  DIFF_ZONE_COST = 3
  MAX_CHARGE = 5
  # diff_remediation = same_zone_cost - max_charge

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
    it 'should have a remediation' do
      expect(journey).to respond_to(:remediation)
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

  describe '#calc_charge' do
    it 'should calculate the cost of a joruney if travelling within the same zone' do
      test_commence
      test_terminate
      journey.calc_charge
      expect(journey.actual_cost).to eq(SAME_ZONE_COST)
    end
    it 'should calculate the cost of a journey to a different zone' do
      test_commence
      journey.terminate_at(barrier_three)
      journey.calc_charge
      expect(journey.actual_cost).to eq(DIFF_ZONE_COST)
    end
  end

  describe '#remediate' do
    it 'should refund the card based on the actual journey' do
      test_commence
      test_terminate
      journey.calc_charge
      diff = MAX_CHARGE - SAME_ZONE_COST
      expect(journey.remediation).to eq(diff)
    end
  end

  private
  def test_commence
    journey.commence_at(barrier_one)
  end

  def test_terminate
    journey.terminate_at(barrier_two)
  end
end
