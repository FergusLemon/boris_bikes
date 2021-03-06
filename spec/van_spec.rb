require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:broken_bike) { double("broken bike", broken?: true) }
  let(:docking_station) { double("docking station", handover_bikes: [broken_bike]) }
  let(:garage) { double("garage", dock: broken_bike) }

  it_behaves_like BikeContainer

  describe '#collect_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:collect_bikes).with(1).argument
    end
    context 'when there are bikes to collect' do
      it 'collects the bikes' do
        van.collect_bikes(docking_station)
        expect(van).not_to be_empty
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
        expect(van).to be_empty
      end
    end
  end
end
