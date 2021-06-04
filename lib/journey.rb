require 'oyster_card'
require 'station'

class Journey
  attr_reader :journey, :balance, :complete, :entry_station, :exit_station

    PENALTY_FARE = 1

    def initialize(station = nil)
      entry_station = station
      exit_station = nil
      complete = false
    end

    def entry_station(station)
      entry_station = station
    end

    def exit_station(station)
      exit_station = station
    end

    def finish(station)
      exit_station = station
      complete = true
      self
    end

    def fare
      PENALTY_FARE
    end

    def complete?
      true
    end
end