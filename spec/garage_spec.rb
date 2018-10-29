require 'garage'

describe Garage do
  let(:garage) { described_class.new }
  let(:broken_bike) { double("broken bike", broken: true) }
  let(:bike) { double("bike", broken: false) }

  it_behaves_like BikeContainer

  describe '#handover_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:handover_bikes)
    end
    before(:each) do
      garage.dock(broken_bike)
      garage.bikes << bike
    end
    it 'hands over fixed bikes to be distributed' do
      expect(garage.handover_bikes).to eq([bike])
    end
    context 'when a fixed bike has been handed over' do
      it 'no longer has the fixed bike' do
        garage.handover_bikes
        expect(garage.bikes).not_to include(bike)
      end
      it 'still has the broken bike' do
        garage.handover_bikes
        expect(garage.bikes).to include(broken_bike)
      end
    end
  end
end
