require_relative 'bike_container'

class Garage
include BikeContainer

  def dock(delivery)
    add_bike(delivery)
  end

  def handover_bikes
     fixed_bikes = []
     fix_bikes
     bikes.each { |bike| fixed_bikes << bike }
     bikes.clear
     fixed_bikes
  end

  private

  def fix_bikes
    bikes.flatten.map! { |bike| bike.fix }
  end
end
