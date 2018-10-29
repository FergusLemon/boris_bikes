require_relative 'bike_container'

class DockingStation
include BikeContainer

  def release_bike
    raise "This docking station is empty." if empty?
    raise "Sorry, all bikes are broken." if bikes_broken?
    bikes.delete_at(working_bike_location)
  end

  def dock(bike)
    add_bike(bike)
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

  def empty?
    bikes.empty?
  end

  def bikes_broken?
    bikes.all? { |bike| bike.broken == true }
  end

  def working_bike_location
    bikes.index { |bike| bike.broken == false }
  end
end
