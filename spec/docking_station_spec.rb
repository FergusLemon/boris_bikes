require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }

  context '#release_bike' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:release_bike)
    end
    it 'releases a bike' do
      expect(docking_station.release_bike).to be_a(Bike)
    end
  end
end
