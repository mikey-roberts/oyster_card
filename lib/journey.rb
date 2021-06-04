require_relative 'oyster_card'
require_relative 'station'

class Journey
  attr_reader :complete, :entry_station, :end_station
  attr_accessor :entry_station, :end_station
  PENALTY_FARE = 6
  def initialize(entry_station = nil)
    @entry_station = entry_station
    @complete = false
    @exit_station = nil
  end
  def exit_station(station)
  @end_station = station
  end
  def finish?
  @end_station == nil || @entry_station == nil
  end
  def complete?
    @complete
  end
  def fare
    @complete = true
    finish? == true ? PENALTY_FARE : 1
  end
  def in_journey?
    !!@entry_station
  end
end