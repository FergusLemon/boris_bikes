class Garage
include BikeContainer

  def dock(delivery)
    add_bike(delivery)
  end

  def handover_bikes
     to_return = []
     bikes.flatten.each do |bike|
       if bike.broken == false
         to_return << bike
         bikes.delete(bike)
       end
     end
     to_return
  end

  private

  def fix_bikes
    bikes.flatten.map! { |bike| bike.fix }
  end
end
