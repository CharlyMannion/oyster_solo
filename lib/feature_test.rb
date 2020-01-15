require_relative 'oystercard'


# to run feature tests in terminal:

# ruby 'lib/feature_test.rb'

# unhash as required:

# p jhist = JourneyHistory.new
# p oys = Oystercard.new(jhist)

p oys = Oystercard.new

# p oys.journey_history
# p oys.balance
# p oys.top_up(10)
# p oys.balance

p dalston = Station.new
p dalston.zone = 1
p dalston.name = :dalston
p barrier1 = Barrier.new
p barrier2 = Barrier.new
p barrier1.assign_to(dalston)
p barrier1.station
p barrier1.station.zone
p barrier2.assign_to(dalston)
p oys.balance
p "tap in"
p oys.tap_in(barrier1)
p "tap Out"
p oys.tap_out(barrier2)
p "current journey below"
p oys.balance
p "journey history below, first"
p oys.journey_history.display

p "second journey"
p barrier3 = Barrier.new
p finsbury = Station.new
p finsbury.zone = 2
p finsbury.name = :finsbury
p barrier3.assign_to(finsbury)
p oys.balance
p oys.tap_in(barrier1)
p oys.tap_out(barrier3)
p oys.balance
p "journey history below, second"
# p oys.journey_history.display
p oys.view_history

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
