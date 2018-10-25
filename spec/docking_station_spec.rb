require 'docking_station'
describe DockingStation do
  let(:docking_station) { DockingStation.new }
  context '#release_bike' do
    it 'recognises this message' do
      expect(docking_station).to respond_to(:release_bike)
    end
  end
end
