class Journey
  attr_accessor :entry_barrier, :exit_barrier, :complete

  def initialize
    @entry_barrier
    @exit_barrier
    @complete = complete?
  end

  def commence_at(barrier)
    @entry_barrier = barrier
  end

  def terminate_at(barrier)
    @exit_barrier = barrier
    complete?
  end

  private
  def complete?
    if @entry_barrier != nil && @exit_barrier != nil
      @complete = true
    else
      @complete = false
    end
  end

end
