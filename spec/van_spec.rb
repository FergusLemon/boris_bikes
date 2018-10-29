require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:broken_bike) { double :bike }
  let(:docking_station) { double("docking station", handover_bikes: [broken_bike]) }
  let(:garage) { double("garage", dock: broken_bike) }

  it_behaves_like BikeContainer

  describe '#initialize' do
    context 'when no capacity is given' do
      it 'defaults to a capacity of twenty' do
        expect(van.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end
    end
    context 'when a capacity is given' do
      it 'overrides the default capacity' do
        random_capacity = rand(100)
        random_capacity_van = described_class.new(random_capacity)
        expect(random_capacity_van.capacity).to eq(random_capacity)
      end
    end
  end

  describe '#collect_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:collect_bikes).with(1).argument
    end
    context 'when there are bikes to collect' do
      it 'collects the bikes' do
        van.collect_bikes(docking_station)
        expect(van.bikes).to eq([broken_bike])
      end
    end
  end

  describe '#deliver_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:deliver_bikes).with(1).argument
    end
    context 'when there are bikes to deliver' do
      it 'delivers the bikes' do
        van.collect_bikes(docking_station)
        van.deliver_bikes(garage)
        expect(van.bikes).to be_empty
      end
    end
  end
end
