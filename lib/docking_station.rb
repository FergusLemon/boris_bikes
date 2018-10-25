class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "This docking station is empty." if @bikes.empty?
    bike = Bike.new
  end

  def dock(bike)
    raise "This docking station is full." if @bikes.size == 20
    @bikes << bike
  end
end
