require 'bike'
describe Bike do
  let(:bike) { Bike.new }
  context '#working?' do
    it 'recognises this message' do
      expect(bike).to respond_to(:working?)
    end
  end

end
