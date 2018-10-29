require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:broken_bike) { double :bike }
  let(:docking_station) { double("docking station", handover_bikes: [broken_bike]) }
  let(:garage) { double("garage", dock: broken_bike) }

  describe '#collect_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:collect_bikes).with(1).argument
    end
    context 'when there are bikes to collect' do
      it 'collects the bikes' do
        van.collect_bikes(docking_station)
        expect(van.bikes).to eq([[broken_bike]])
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
