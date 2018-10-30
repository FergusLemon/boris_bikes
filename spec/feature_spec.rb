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
#As a member of the public,
#So that I reduce the chance of getting a broken bike in future,
#I'd like to report a bike as broken when I return it.
puts "bike.report_broken"
puts bike.report_broken
puts
#As a member of the public,
#So that I am not confused and charged unnecessarily,
#I'd like docking stations not to release bikes when there are none available.
puts "docking_station.release_bike"
puts "This docking station is empty. (RuntimeError)"
puts
#As a member of the public
#So I can return bikes I've hired
#I want to dock my bike at the docking station
#
#As a maintainer of the system,
#So that I can manage broken bikes and not disappoint users,
#I'd like docking stations to accept returning bikes (broken or not).
puts "docking_station.dock(bike)"
puts docking_station.dock(bike)
puts
puts "docking_station.dock(another_bike)"
puts docking_station.dock(another_bike)
puts
#As a system maintainer,
#So that I can plan the distribution of bikes,
#I want a docking station to have a default capacity of 20 bikes.
#
#As a maintainer of the system,
#So that I can control the distribution of bikes,
#I'd like docking stations not to accept more bikes than their capacity.
puts "another_docking_station = DockingStation.new"
puts another_docking_station = DockingStation.new
puts "another_docking_station.capacity.times { another_docking_station.dock(Bike.new) }"
puts another_docking_station.capacity.times { another_docking_station.dock(Bike.new) }
puts "another_docking_station.dock(Bike.new)"
puts "This docking station is full. (RuntimeError)"
puts
#As a system maintainer,
#So that busy areas can be served more effectively,
#I want to be able to specify a larger capacity when necessary.
puts "a_larger_docking_station = DockingStation.new(50)"
puts a_larger_docking_station = DockingStation.new(50)
puts "a_larger_docking_station.capacity.times { a_larger_docking_station.dock(Bike.new) }"
puts a_larger_docking_station.capacity.times { a_larger_docking_station.dock(Bike.new) }
puts
#As a person,
#So that I can use a bike,
#I'd like a docking station to release a bike.
puts "docking_station.release_bike"
puts docking_station.release_bike
#As a maintainer of the system,
#So that I can manage broken bikes and not disappoint users,
#I'd like docking stations not to release broken bikes.
puts "docking_station.release_bike"
puts "Sorry, all bikes are broken. (RuntimeError)"
puts
#As a maintainer of the system,
#So that I can manage broken bikes and not disappoint users,
#I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
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

#As a maintainer of the system,
#So that I can manage broken bikes and not disappoint users,
#I'd like vans to collect working bikes from garages and distribute them to docking stations.
puts "van.collect_bikes(garage)"
puts van.collect_bikes(garage)
#As a person,
#So that I can use a good bike,
#I'd like to see if a bike is working
puts "bike.broken?"
puts bike.broken?
puts

puts "van.deliver_bikes(docking_station)"
puts van.deliver_bikes(docking_station)
puts "docking_station.release_bike"
puts docking_station.release_bike
puts
#As a maintainer of the system,
#So that members of the public can get usable bikes,
#I'd like docking stations to ensure that returned entities are actually bikes
puts "docking_station.dock(garage)"
puts "Garage is not a Bike. (RuntimeError)"
