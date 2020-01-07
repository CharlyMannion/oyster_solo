class Journey
  attr_accessor :entry_barrier, :exit_barrier

  def initialize
    @entry_barrier
    @exit_barrier
  end

  def start_at(barrier)
    @entry_barrier = barrier
  end
end
