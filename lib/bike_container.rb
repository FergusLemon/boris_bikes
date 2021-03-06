require_relative 'bike'

module BikeContainer
attr_reader :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
    raise "#{bike.class} is not a Bike." if not_a_bike?(bike)
    raise "This #{self.class} is full." if full?
    bikes << bike
  end

  def empty?
    bikes.empty?
  end

  private
  attr_reader :bikes

  def full?
    bikes.size == capacity
  end

  def not_a_bike?(bike)
    true unless bike.respond_to?(:broken?)
  end
end
