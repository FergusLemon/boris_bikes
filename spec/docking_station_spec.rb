require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  describe '#release_bike' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:release_bike)
    end
    context 'when there are bikes docked' do
      it 'releases a bike' do
        docking_station.dock(bike)
        expect(docking_station.release_bike).to be_a(Bike)
      end
    end
    context 'when empty' do
      it 'does not release a bike' do
        expect { docking_station.release_bike }.to raise_error(RuntimeError, "This docking station is empty.")
      end
    end
  end

  describe '#dock' do
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
