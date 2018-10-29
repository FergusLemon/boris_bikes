class Van
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(location)
    bikes << location.handover_bikes
  end

  def deliver_bikes(location)
    location.receive_bikes(bikes.pop)
  end
end
