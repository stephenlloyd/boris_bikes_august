require 'docking_station'

describe DockingStation do 
	let(:station){DockingStation.new}
	let(:bike) {double :bike, broken?: false}
	let(:broken_bike){double :bike, broken?: true}

	it "should accept a bike" do
		station.dock(bike)
		expect(station.bikes).to eq [bike]
	end

	it "provide a list of available bikes" do
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq [bike]
	end
end