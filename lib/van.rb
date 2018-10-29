class Van
attr_reader :bikes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def collect_bikes(location)
    bikes << location.handover_bikes
  end

  def deliver_bikes(location)
    bikes.flatten.each do |bike|
      location.dock(bike)
    end
    bikes.clear
  end
end
