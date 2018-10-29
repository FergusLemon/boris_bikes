class Garage
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive_bikes(delivery)
    bikes << delivery
  end
end
