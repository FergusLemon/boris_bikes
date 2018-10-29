require 'garage'

describe Garage do
  let(:garage) { described_class.new }
  let(:broken_bike) { double("broken bike", broken: true) }
  let(:bike) { double("bike", broken: false) }

  describe '#receive_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:receive_bikes).with(1).argument
    end
    it 'accepts the bikes delivered' do
      garage.receive_bikes([broken_bike])
      expect(garage.bikes).to include([broken_bike])
    end
  end

  describe '#fix_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:fix_bikes)
    end
    it 'fixes any broken bikes' do
      garage.receive_bikes([broken_bike])
      allow(broken_bike).to receive(:broken=).with(false)
      garage.fix_bikes
      expect(garage.bikes).to include([broken_bike])
    end
  end

  describe '#handover_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:handover_bikes)
    end
    before(:each) do
      garage.receive_bikes([broken_bike])
      garage.bikes << [bike]
    end
    it 'hands over fixed bikes to be distributed' do
      expect(garage.handover_bikes).to eq([bike])
    end
 #    context 'when a broken bike has been handed over' do
 #      it 'no longer has the broken bike docked' do
 #        docking_station.handover_bikes
 #        expect(docking_station.bikes).not_to include(broken_bike)
 #      end
 #    end
   end
end
