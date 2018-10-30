# Boris Bikes
A program written in Ruby as part of the Makers Academy course (week 1).  The program attempts to implement the 'Boris Bike' system used in London.
Users can get working bikes from docking stations and return the bikes (working or broken) to docking stations.  Users can also report that a bike is broken.
Docking stations will accept all bikes, no matter what condition, but will only release working bikes to users. Vans collect and deliver bikes between docking stations
and garages, garages fix bikes. Vans, docking stations and garages all have a limited capacity and only accept bikes. 

### Installation

- [ ] Step 1 - Clone this repository by copying the link available at the top of this webpage in the green button labelled 'Clone or Download'. 
- [ ] Step 2 - Open up a Terminal window (Mac OS) and run `git clone <link>` where `<link>` is what you copied in the previous step.
- [ ] Step 3 - `cd` into the cloned directory.
- [ ] Step 4 - Open `irb`, `pry` or any other interactive Ruby interpreter.
- [ ] Step 5 - `require` the pilot.rb file located in the `lib` directory.  Your interactive Ruby interpreter may have done this for you already depending on its configuration settings, if so jump to Step 6. 
- [ ] Step 6 - You can now instantiate objects of classes Bike, Garage, Van and DockingStation and send them messages to invoke behaviour. The file `feature_spec.rb` lists user stories and exhibits much of the program's functionality.
To see this run `ruby spec/feature_spec.rb` from the command line when the working directory is the `boris_bikes` directory.

### Code Example
In these code examples `>>` represents the command line prompt.  Lines without the prompt show the return value of the preceeding expression.

Instantiate a Bike and a DockingStation and #dock the bike at the docking_station:
```
>> bike = Bike.new
#<Bike:0x007fb5308f0a60 @broken=false>
>> docking_station = DockingStation.new
#<DockingStation:0x007fb5318d68d0 @capacity=20, @bikes=[]>
>> docking_station.dock(bike)
[
    [0] #<Bike:0x007fb5308f0a60 @broken=false>
]
>> docking_station
#<DockingStation:0x007fb5318d68d0 @capacity=20, @bikes=[#<Bike:0x007fb5308f0a60 @broken=false>]>
```
