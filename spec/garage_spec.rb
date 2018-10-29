require 'garage'

describe Garage do
  let(:garage) { described_class.new }
  let(:broken_bike) { double("broken bike", broken: true) }
  let(:bike) { double("bike", broken: false) }

  it_behaves_like BikeContainer

  describe '#initialize' do
    context 'when no capacity is given' do
      it 'defaults to a capacity of twenty' do
        expect(garage.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end
    end
    context 'when a capacity is given' do
      it 'overrides the default capacity' do
        random_capacity = rand(100)
        random_capacity_garage = described_class.new(random_capacity)
        expect(random_capacity_garage.capacity).to eq(random_capacity)
      end
    end
  end

  describe '#dock' do
    it 'recognises this message' do
      expect(garage).to respond_to(:dock).with(1).argument
    end
    it 'accepts the bikes delivered' do
      garage.dock(broken_bike)
      expect(garage.bikes).to include(broken_bike)
    end
  end

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
