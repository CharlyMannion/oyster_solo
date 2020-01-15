class JourneyHistory
  attr_accessor :journeys

  def initialize
    @journeys = []

  end

  def record(journey)
    @journeys << journey
  end

  def display
    to_display = "Journey History: "
    @journeys.each { |journey|
      to_display << "#{journey.entry_barrier.station.name} - #{journey.exit_barrier.station.name}; "
     }
     to_display.delete_suffix('; ')
  end
end
