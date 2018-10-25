require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  context '#release_bike' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:release_bike)
    end
    it 'releases a bike' do
      expect(docking_station.release_bike).to be_a(Bike)
    end
  end

  context '#dock' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:dock).with(1).argument
    end
    context '1 bike has been docked' do
      it 'has the bike in its dock' do
        docking_station.dock(bike)
        expect(docking_station.bikes).to include(bike)
      end
    end
  end
end
