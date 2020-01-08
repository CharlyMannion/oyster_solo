class Journey
  attr_accessor :entry_barrier, :exit_barrier, :complete, :max_charge
  MAX_CHARGE = 5

  def initialize(max_charge = MAX_CHARGE)
    @entry_barrier
    @exit_barrier
    @complete = complete?
    @max_charge = max_charge
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
