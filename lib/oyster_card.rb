class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 0
  MINIMUM_CHARGE = 5

  attr_reader :balance, :journeys, :exit_station, :entry_station

  def initialize
    @journeys = { }
    @balance = 0
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE

    @balance += amount 
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if balance < MINIMUM_CHARGE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    fail "Minimum balance of #{MINIMUM_BALANCE} exceeded" if balance - amount < MINIMUM_BALANCE

    @balance -= amount
  end

end