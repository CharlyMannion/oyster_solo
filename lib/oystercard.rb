require_relative 'barrier'
require_relative 'journey_history'
require_relative 'journey'
require_relative 'station'

class Oystercard
  DEFAULT_BALANCE = 10
  MAX_CHARGE = 5

  attr_accessor :balance, :in_journey, :journey_history, :current_journey, :max_charge

  def initialize(journey_history = JourneyHistory.new, journey_class = Journey)
    @balance = DEFAULT_BALANCE
    @in_journey = false
    @journey_history = journey_history
    @journey_class = journey_class
    @current_journey
  end

  def top_up(amount)
    @balance += amount
  end

  def tap_in(barrier)
    @in_journey = true
    new_journey = @journey_class.new
    new_journey.commence_at(barrier)
    @current_journey = new_journey
    charge_fare(@current_journey.max_charge)
  end

  def tap_out(barrier)
    @in_journey = false
    @current_journey.terminate_at(barrier)
    for_history = @current_journey
    @journey_history.record(for_history)
    # remediate_card(@current_journey.remediation)
  end

  def charge_fare(amount)
    @balance -= amount
  end

  def remediate_card(amount)
    @balance += amount
  end

end

# to run feature tests in terminal:

# ruby 'lib/oystercard.rb'

# unhash:
# p jhist = JourneyHistory.new
# p oys = Oystercard.new(jhist)

p oys = Oystercard.new

# p oys.journey_history
# p oys.balance
# p oys.top_up(10)
# p oys.balance

# p dalston = Station.new
# p dalston.zone = 1
# p barrier1 = Barrier.new
# p barrier2 = Barrier.new
# p barrier1.assign_to(dalston)
# p barrier1.station
# p barrier1.station.zone
# p barrier2.assign_to(dalston)
# p oys.balance
# p oys.tap_in(barrier1)
# p oys.current_journey.remediation
# p oys.tap_out(barrier2)
# p oys.balance

# p "current journey after tap out below"
# p oys.current_journey
# p oys.in_journey
# p oys.journey_history
# p "second journey below"
# p oys.tap_in(barrier2)
# p "current journey below"
# p oys.current_journey
# p oys.tap_out(barrier1)
# p oys.journey_history
