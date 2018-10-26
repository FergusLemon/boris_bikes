require 'bike'

describe Bike do
  let(:bike) { Bike.new }

  describe '#broken?' do
    it 'recognises this message' do
      expect(bike).to respond_to(:broken?)
    end
    it 'responds "false" when it is working' do
      expect(bike).to_not be_broken
    end
    context 'when broken' do
      it 'responds "true"' do
        bike.report_broken
        expect(bike).to be_broken
      end
    end
  end
end
