class Journey
  attr_accessor :entry_barrier, :exit_barrier

  def initialize
    @entry_barrier
    @exit_barrier
  end

  def commence_at(barrier)
    @entry_barrier = barrier
  end

  def terminate_at(barrier)
    @exit_barrier = barrier
  end
end
