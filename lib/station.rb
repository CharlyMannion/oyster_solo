require_relative 'barrier'

class Station
  attr_accessor :zone, :barriers

  def initialize(barrier_class = Barrier)
    @zone
    @barrier_class = barrier_class
    @barriers = []
  end

  def add_barrier(barrier = @barrier_class.new)
    @barriers << barrier
  end
end
