require 'oystercard'
# require 'barrier'

describe Oystercard do
  DEFAULT_BALANCE = 10

  subject(:oystercard) { described_class.new }
  top_up_amount = 10
  let(:barrier) { double :barrier }
  let(:barrier_two) { double :barrier }
  let(:journey_history_double) { double :journey_history, journeys: [] }
  let(:journey_double) { double :journey }

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
  end

  describe '#tap_in' do
    it 'marks the card is in journey' do
      oystercard.tap_in(barrier)
      expect(oystercard.in_journey).to eq(true)
    end
    it 'creates a journey' do
      oystercard.tap_in(barrier)
      p oystercard.current_journey
      # expect(oystercard.current_journey).not_to eq(nil)
      expect(oystercard.current_journey).to eq([barrier])
      # p journey_history_double
      # p journey_history_double.journeys
      # expect(journey_history_double.journeys).not_to eql([])
    end
  end

  describe '#tap_out' do
    it 'marks the card as not journey' do
      oystercard.tap_in(barrier)
      oystercard.tap_out(barrier_two)
      expect(oystercard.in_journey).to eq(false)
    end
  end
end

# irb
# require './lib/oystercard.rb'
# oys = Oystercard.new
# oys.balance
# oys.top_up(10)
# oys.balance
