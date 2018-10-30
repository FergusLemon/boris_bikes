require './lib/docking_station'
require './lib/bike'
require './lib/van'
require './lib/garage'

puts
puts "docking_station = DockingStation.new"
puts docking_station = DockingStation.new
puts

puts "bike = Bike.new"
puts bike = Bike.new
puts
puts "another_bike = Bike.new"
puts another_bike = Bike.new
puts "bike.report_broken"
puts bike.report_broken
puts

puts "docking_station.release_bike"
puts "This docking station is empty. (RuntimeError)"
puts

puts "docking_station.dock(bike)"
puts docking_station.dock(bike)
puts
puts "docking_station.dock(another_bike)"
puts docking_station.dock(another_bike)
puts
puts "docking_station.release_bike"
puts docking_station.release_bike
puts "docking_station.release_bike"
puts "Sorry, all bikes are broken. (RuntimeError)"
puts

puts "van = Van.new"
puts van = Van.new
puts

puts "van.collect_bikes(docking_station)"
puts van.collect_bikes(docking_station)
puts

puts "garage = Garage.new"
puts garage = Garage.new
puts

puts "van.deliver_bikes(garage)"
puts van.deliver_bikes(garage)
puts

puts "van.collect_bikes(garage)"
puts van.collect_bikes(garage)
puts "bike.broken?"
puts bike.broken?
puts

puts "van.deliver_bikes(docking_station)"
puts van.deliver_bikes(docking_station)
puts "docking_station.release_bike"
puts docking_station.release_bike
puts

puts "docking_station.dock(garage)"
puts "Garage is not a Bike. (RuntimeError)"
