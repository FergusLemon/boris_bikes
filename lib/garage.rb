class Garage
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(delivery)
    bikes << delivery
  end

  def fix_bikes
    bikes.flatten.map! { |bike| bike.broken = false }
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
end
