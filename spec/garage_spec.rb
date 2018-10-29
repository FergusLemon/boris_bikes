require 'garage'

describe Garage do
  let(:garage) { described_class.new }
  let(:broken_bike) { double("broken bike") }

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
end
