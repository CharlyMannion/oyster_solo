class Oystercard
  DEFAULT_BALANCE = 10

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    @balance += amount
  end
end
