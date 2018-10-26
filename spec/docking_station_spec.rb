require 'docking_station'
require 'bike'

describe DockingStation do
  DEFAULT_CAPACITY = 20
  LARGER_CAPACITY = 25
  let(:docking_station) { described_class.new }
  let(:larger_docking_station) { described_class.new(LARGER_CAPACITY) }
  let(:bike) { double("bike", :broken => false, :broken? => false) }
  let(:broken_bike) { double("broken bike", :report_broken => true, :broken => true) }

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
      before(:each) do
        docking_station.dock(bike)
        broken_bike.report_broken
      end
      it 'releases a working bike' do
        released_bike = docking_station.release_bike
        expect(released_bike).to_not be_broken
      end
      it 'does not release a broken bike' do
        docking_station.dock(broken_bike)
        expect { docking_station.release_bike }.to raise_error(RuntimeError, "This bike is broken.")
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
    end
    context 'when default capacity is used' do
      it 'has a capacity of twenty' do
        expect { DEFAULT_CAPACITY.times { docking_station.dock(bike) } }.not_to raise_error
      end
      it 'does not accept bikes when full' do
        expect { LARGER_CAPACITY.times { docking_station.dock(bike) } }.to raise_error(RuntimeError, "This docking station is full.")
      end
    end
    context 'when a user defined capacity is used' do
      it 'overrides the defualt capacity' do
        expect { LARGER_CAPACITY.times { larger_docking_station.dock(bike) } }.not_to raise_error
      end
    end
  end
end
