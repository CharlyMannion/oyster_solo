require 'oystercard'

describe Oystercard do
  DEFAULT_BALANCE = 10

  subject(:oystercard) { described_class.new }
  top_up_amount = 10

  it 'should respond to balance' do
    expect(oystercard).to respond_to :balance
  end

  describe '#initalize' do
    it 'should have a default amount as starting balance' do
      expect(oystercard.balance).to eq(DEFAULT_BALANCE)
    end
  end

  describe '#top_up' do
    it 'should increase the oystercard by a specified amount' do
      new_balance = DEFAULT_BALANCE + top_up_amount
      oystercard.top_up(top_up_amount)
      expect(oystercard.balance).to eq(new_balance)
    end
  end
end

# irb
# require './lib/oystercard.rb'
# oys = Oystercard.new
# oys.balance
# oys.top_up(10)
# oys.balance
