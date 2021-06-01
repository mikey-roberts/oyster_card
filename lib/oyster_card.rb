class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE

    @balance += amount 
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
  end

  def touch_out
  end

end