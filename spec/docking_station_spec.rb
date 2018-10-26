require 'docking_station'
require 'bike'

describe DockingStation do
  DEFAULT_CAPACITY = 20
  LARGER_CAPACITY = 25
  let(:docking_station) { DockingStation.new }
  let(:larger_docking_station) { DockingStation.new(LARGER_CAPACITY) }
  let(:bike) { Bike.new }

  describe '#initialize' do
    context 'when no capacity is given' do
      it 'defaults to a capacity of twenty' do
        expect(docking_station.capacity).to eq(DEFAULT_CAPACITY)
      end
    end
    context 'when a capacity is given' do
      it 'overrides the default capacity' do
        expect(larger_docking_station.capacity).to eq(LARGER_CAPACITY)
      end
    end
  end

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
    context 'when one bike has been docked' do
      it 'has the bike in its dock' do
        docking_station.dock(bike)
        expect(docking_station.bikes).to include(bike)
      end
      it 'has a default capacity of twenty' do
        expect { DEFAULT_CAPACITY.times { docking_station.dock(bike) } }.not_to raise_error
      end
    end
  end
end
