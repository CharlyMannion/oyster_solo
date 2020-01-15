require 'oystercard'

describe Oystercard do
  DEFAULT_BALANCE = 10
  MAX_CHARGE = 5
  top_up_amount = 10

  subject(:oystercard) { described_class.new }

  let(:barrier) { double :barrier, station: station_double }
  let(:barrier_two) { double :barrier, station: station_double }
  let(:station_double) { double :station, zone: 1, name: :dalston }
  let(:journey_history_double) { double :journey_history, journeys: [] }
  let(:journey_double) { double :journey, entry_barrier: :barrier, exit_barrier: :barrier_two, complete: true }

  it 'should respond to balance' do
    expect(oystercard).to respond_to :balance
  end
  it 'should respond to tap_in' do
    expect(oystercard).to respond_to(:tap_in).with(1).arguments
  end
  it 'should respond to journey_history' do
    expect(oystercard).to respond_to :journey_history
  end

  describe '#initalize' do
    it 'should have a default amount as starting balance' do
      expect(oystercard.balance).to eq(DEFAULT_BALANCE)
    end
    it 'should not be in journey when initialized' do
      expect(oystercard.in_journey).to eq(false)
    end
    it 'should have an instance of journey history' do
      oys_test = Oystercard.new(journey_history_double)
      expect(oys_test.journey_history).to eq(journey_history_double)
    end
    it 'should have an instance JourneyHistory' do
      expect(oystercard.journey_history).to be_a JourneyHistory
    end
  end

  describe '#top_up' do
    it 'should increase the oystercard by a specified amount' do
      new_balance = DEFAULT_BALANCE + top_up_amount
      oystercard.top_up(top_up_amount)
      expect(oystercard.balance).to eq(new_balance)
    end
    it 'should raise an error if you attempt to top up too much' do
      expect { oystercard.top_up(1000) }.to raise_error "Max top up is £50"
    end
  end

  describe '#tap_in' do
    before do
      test_in
    end
    it 'marks the card is in journey' do
      expect(oystercard.in_journey).to eq(true)
    end
    it 'records the start of a current_journey' do
      oystercard.current_journey
      expect(oystercard.current_journey).not_to eq(nil)
      # expect(oystercard.current_journey).to eq([barrier])
    end
    it 'creates a new journey' do
      expect(oystercard.current_journey).to be_a Journey
    end
    it 'charges the max_charge' do
      new_balance = DEFAULT_BALANCE - MAX_CHARGE
      expect(oystercard.balance).to eq(new_balance)
    end
    it 'should raise an error if the balance is 0' do
      allow(oystercard).to receive(:balance).and_return(0)
      p oystercard.balance
      expect { oystercard.tap_in(barrier_two) }.to raise_error "Insufficient balance"
    end
  end

  describe '#tap_out' do
    before do
      test_in
      test_out
    end
    it 'marks the card as not in journey' do
      expect(oystercard.in_journey).to eq(false)
    end
    it 'records the end of a current_journey' do
      expect(oystercard.current_journey.complete).to be(true)
    end
    it 'remediates the card based on the actual journey cost' do
      remediation = 3
      new_balance = DEFAULT_BALANCE - MAX_CHARGE + remediation
      expect(oystercard.balance).to eq(new_balance)
    end
  end

  describe '#completed' do
    before do
      test_in
      test_out
    end
    it 'should add a completed journey to the journey history' do
      expect(oystercard.journey_history.journeys.first).to be_a Journey
      # allow(oystercard).to receive(:current_journey).and_return(journey_double)
      # expect(oystercard.journey_history.journeys.first).to eq(journey_double)
    end
  end

  describe '#journey_history' do
    before do
      test_in
      test_out
    end
    it 'should be be able to have more than one journey' do
      test_in
      test_out
      expect(oystercard.journey_history.journeys.length).to be(2)
    end
  end

  describe '#charge_fare' do
    it 'should reduce the balance' do
      oystercard.charge_fare(MAX_CHARGE)
      new_balance = DEFAULT_BALANCE - MAX_CHARGE
      expect(oystercard.balance).to eq(new_balance)
    end
  end

  describe '#remediate_card' do
    it 'should remedate the amount for same zone journey' do
      oystercard.charge_fare(MAX_CHARGE)
      remediation = 3
      new_balance = DEFAULT_BALANCE - MAX_CHARGE + remediation
      oystercard.remediate_card(remediation)
      expect(oystercard.balance).to eq(new_balance)
    end
  end

  describe '#view_history' do
    it 'should show the journey history' do
      test_in
      test_out
      test_history = "Journey History: dalston - dalston"
      expect(oystercard.view_history).to eq(test_history)
    end
  end

  private
  def test_in
    oystercard.tap_in(barrier)
  end

  def test_out
    oystercard.tap_out(barrier_two)
  end
end
