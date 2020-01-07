class Journey
  attr_accessor :entry_barrier, :exit_barrier, :complete

  def initialize
    @entry_barrier
    @exit_barrier
    @complete = false
  end

  def commence_at(barrier)
    @entry_barrier = barrier
  end

  def terminate_at(barrier)
    @exit_barrier = barrier
    @complete = true
  end

end
