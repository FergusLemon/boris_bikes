require 'garage'

describe Garage do
  let(:garage) { described_class.new }

  describe '#receive_bikes' do
    it 'recognises this message' do
      expect(garage).to respond_to(:receive_bikes)
    end
  end
end
