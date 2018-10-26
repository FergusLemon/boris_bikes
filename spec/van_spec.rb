require 'van'

describe Van do
  let(:van) { described_class.new }

  describe '#take_broken_bikes' do
    it 'recognises this message' do
      expect(van).to respond_to(:take_broken_bikes)
    end
  end
end
