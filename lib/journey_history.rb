class JourneyHistory
  attr_accessor :journeys

  def initialize
    @journeys = []
  end

  def record(journey)
    @journeys << journey
  end

  def display
    # test = "Journey History: #{jhist.journeys[0].entry_barrier.station.name} - #{jhist.journeys[0].exit_barrier.station.name}; #{jhist.journeys[1].entry_barrier.station.name} - #{jhist.journeys[1].exit_barrier.station.name}"
    # "Journey History: #{@journeys[0].entry_barrier.station.name} - #{@journeys[0].exit_barrier.station.name}; #{@journeys[1].entry_barrier.station.name} - #{@journeys[1].exit_barrier.station.name}"
    @journeys.each { |journey|
      p "#{journey.entry_barrier.station.name} - #{journey.exit_barrier.station.name};"
     }
  end
end
