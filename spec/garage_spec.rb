require 'garage'

describe Garage do
  let(:garage) { described_class.new }
  let(:bike) { double("bike", broken: false, broken?: false) }

  it_behaves_like BikeContainer

  describe '#handover_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:handover_bikes)
    end
    before(:each) do
      garage.add_bike(bike)
      allow(bike).to receive(:fix)
    end
    it 'hands over fixed bikes to be distributed' do
      expect(garage.handover_bikes).to eq([bike])
    end
    context 'when a fixed bike has been handed over' do
      it 'no longer has the fixed bike' do
        garage.handover_bikes
        expect(garage).to be_empty
      end
    end
  end
end
