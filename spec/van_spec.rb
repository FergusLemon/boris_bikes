require 'van'

describe Van do
  let(:van) { described_class.new }

  describe '#collect_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:collect_bikes).with(1).argument
    end
  end
end
