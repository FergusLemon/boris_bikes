require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:broken_bike) { double :bike }
  let(:docking_station) { double("docking station", handover_bikes: [broken_bike]) }
  let(:garage) { double :garage }

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
  end
end
