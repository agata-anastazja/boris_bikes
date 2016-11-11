require './lib/bike.rb'

class DockingStation
  attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no more working bikes!" if empty?

    working_bike
  end

  def working_bike
    released_bike = nil
    @docked_bikes.each do |bike|
        if bike.working
          released_bike = bike
        end
    end
    raise "There are no more working bikes!" if released_bike == nil
    @docked_bikes.delete(released_bike)
  end


  def dock(new_bike)
      raise "Docking station is full" if full?
      @docked_bikes << new_bike
  end

  private
    def full?
      @docked_bikes.length == @capacity
    end

    def empty?
      @docked_bikes.empty?
    end

end
