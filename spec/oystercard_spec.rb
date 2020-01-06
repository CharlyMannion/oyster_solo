require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'should respond to balance' do
    expect(oystercard).to respond_to :balance
  end
end
