class Journey
  attr_accessor :entry_barrier

  def initialize
    @entry_barrier
  end

  def start_at(barrier)
    @entry_barrier = barrier
  end
end
