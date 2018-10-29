class Van
attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def collect_bikes(location)
    collected_bikes = location.handover_bikes
    collected_bikes.each { |bike| bikes << bike }
  end

  def deliver_bikes(location)
    bikes.each { |bike| location.dock(bike) }
    bikes.clear
  end
end
