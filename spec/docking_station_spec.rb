require 'docking_station'
require 'bike'

describe DockingStation do
  let(:docking_station) { described_class.new }
  let(:bike) { double("bike", broken: false, broken?: false) }
  let(:broken_bike) { double("broken bike", report_broken: true, broken: true, broken?: true) }

  it_behaves_like BikeContainer

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
      context 'when all bikes are broken' do
        it 'does not release a broken bike' do
          docking_station.release_bike
          docking_station.dock(broken_bike)
          expect { docking_station.release_bike }.to raise_error(RuntimeError, "Sorry, all bikes are broken.")
        end
      end
      context 'when not all bikes are broken' do
        it 'does not release a broken bike' do
          docking_station.dock(broken_bike)
          released_bike = docking_station.release_bike
          expect(released_bike).to_not be_broken
        end
      end
    end
    context 'when empty' do
      it 'does not release a bike' do
        expect { docking_station.release_bike }.to raise_error(RuntimeError, "This docking station is empty.")
      end
    end
  end

  describe '#handover_bikes' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:handover_bikes)
    end
    before(:each) do
      docking_station.dock(broken_bike)
    end
    it 'hands over broken bikes to be fixed' do
      expect(docking_station.handover_bikes).to eq([broken_bike])
    end
    context 'when a broken bike has been handed over' do
      it 'no longer has the broken bike docked' do
        docking_station.handover_bikes
        expect(docking_station).to be_empty
      end
    end
  end
end
