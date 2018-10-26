class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "This docking station is empty." if empty?
    bike = Bike.new
  end

  def dock(bike)
    raise "This docking station is full." if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.size == @capacity
  end

  def empty?
    @bikes.empty?
  end
end
