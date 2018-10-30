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
    broken_bikes = select_broken_bikes
    remove_broken_bikes
    broken_bikes
  end

  private

  def bikes_broken?
    bikes.all? { |bike| bike.broken == true }
  end

  def working_bike_location
    bikes.index { |bike| bike.broken == false }
  end

  def select_broken_bikes
    bikes.select { |bike| bike.broken == true }
  end

  def remove_broken_bikes
    bikes.delete_if { |bike| bike.broken == true }
  end
end
