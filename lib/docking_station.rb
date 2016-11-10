require './lib/bike.rb'

class DockingStation
  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20
  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "There are no more bikes!" if empty?
    @docked_bikes.shift
  end


  def dock(new_bike)
      raise "Docking station is full" if full?
      @docked_bikes << new_bike
  end

  def any_bikes_docked?
    @docked_bikes.any?
  end

  private
    def full?
      @docked_bikes.length == DEFAULT_CAPACITY
    end


    def empty?
      @docked_bikes.empty?
    end

end
