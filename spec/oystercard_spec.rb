require 'oystercard'

describe Oystercard do
  DEFAULT_BALANCE = 10

  subject(:oystercard) { described_class.new }

  it 'should respond to balance' do
    expect(oystercard).to respond_to :balance
  end

  describe '#initalize' do
    it 'should have a default amount as starting balance' do
      expect(oystercard.balance).to eq(DEFAULT_BALANCE)
    end
  end
end
