class JourneyHistory
  attr_accessor :journeys

  def initialize
    @journeys = []
  end

  def record(journey)
    @journeys << journey
  end
end
