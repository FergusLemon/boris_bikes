require_relative 'bike'

module BikeContainer
attr_reader :capacity, :bikes
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    raise "This #{self.class} is full." if full?
    bikes << bike
  end

  private

  def full?
    bikes.size == capacity
  end
end
