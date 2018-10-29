require 'bike_container'
shared_examples_for BikeContainer do
  let(:bike_container) { described_class.new }
  let(:bike) { double("bike", broken?: false) }
  let(:tractor) { double("tractor") }

  describe '#initialize' do
    context 'when no capacity is given' do
      it 'takes the default capacity' do
        expect(bike_container.capacity).to eq(described_class::DEFAULT_CAPACITY)
      end
    end
    context 'when a capacity is given' do
      it 'overrides the default capacity' do
        random_capacity = rand(100)
        random_capacity_bike_container = described_class.new(random_capacity)
        expect(random_capacity_bike_container.capacity).to eq(random_capacity)
      end
    end
  end

  describe '#add_bike' do
    it 'recognises this message' do
      expect(bike_container).to respond_to(:add_bike).with(1).argument
    end
    it 'only adds bikes' do
      expect {  bike_container.add_bike(tractor) }.to raise_error(RuntimeError, "#{tractor.class} is not a Bike.")
    end
    context 'when one bike has been added' do
      it 'contains the bike' do
        bike_container.add_bike(bike)
        expect(bike_container.bikes).to include(bike)
      end
    end
    context 'when default capacity is used' do
      it 'has a capacity of twenty' do
        expect { described_class::DEFAULT_CAPACITY.times { bike_container.add_bike(bike) } }.not_to raise_error
      end
      it 'does not accept bikes when full' do
        described_class::DEFAULT_CAPACITY.times { bike_container.add_bike(bike) }
        expect { bike_container.add_bike(bike) }.to raise_error(RuntimeError, "This #{described_class} is full.")
      end
    end
    context 'when a user defined capacity is used' do
      it 'overrides the defualt capacity' do
        random_capacity = rand(100)
        random_capacity_bike_container = described_class.new(random_capacity)
        expect { random_capacity.times { random_capacity_bike_container.add_bike(bike) } }.not_to raise_error
      end
    end
  end
end
