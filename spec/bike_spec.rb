require 'bike'

describe Bike do
  let(:bike) { Bike.new }

  describe '#working?' do
    it 'recognises this message' do
      expect(bike).to respond_to(:working?)
    end
    it 'responds "true" when it is working' do
      expect(bike).to be_working
    end
  end
end
