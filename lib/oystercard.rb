class Oystercard
  DEFAULT_BALANCE = 10

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end
end
