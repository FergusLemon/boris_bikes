require_relative 'bike_container'

class Garage
include BikeContainer

  def dock(delivery)
    add_bike(delivery)
  end

  def handover_bikes
     fix_bikes
     fixed_bikes = select_fixed_bikes
     remove_fixed_bikes
     fixed_bikes
  end

  private

  def fix_bikes
    bikes.each { |bike| bike.fix }
  end

  def select_fixed_bikes
    bikes.select { |bike| bike.broken == false }
  end

  def remove_fixed_bikes
    bikes.delete_if { |bike| bike.broken == false }
  end
end
