class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "This docking station is empty." if empty?
    raise "This bike is broken." if bike_broken?
    bikes.pop
  end

  def dock(bike)
    raise "This docking station is full." if full?
    bikes << bike
  end

  def handover_bikes
    to_return = []
    bikes.each do |bike|
      if bike.broken == true
        to_return << bike
        bikes.delete(bike)
      end
    end
    to_return
  end

  private

  def full?
    bikes.size == capacity
  end

  def empty?
    bikes.empty?
  end

  def bike_broken?
    bikes.last.broken
  end
end
