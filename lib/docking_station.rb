class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "This docking station is empty." if empty?
    raise "Sorry, all bikes are broken." if bikes_broken?
    i = bikes.index { |bike| bike.broken == false }
    bikes.delete_at(i)
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

  def bikes_broken?
    bikes.all? { |bike| bike.broken == true }
  end
end
