class DockingStation
  attr_reader :bikes

  def initialize
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
    @bikes.size == 20
  end

  def empty?
    @bikes.size == 0
  end
end
