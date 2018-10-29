require_relative 'bike_container'
class Van
include BikeContainer

  def collect_bikes(location)
    collected_bikes = location.handover_bikes
    collected_bikes.each { |bike| add_bike(bike) }
  end

  def deliver_bikes(location)
    bikes.each { |bike| location.dock(bike) }
    bikes.clear
  end
end
