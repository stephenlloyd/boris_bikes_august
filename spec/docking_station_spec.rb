require 'docking_station'

describe DockingStation do 
	let(:station){DockingStation.new}
	let(:bike) {double :bike, broken?: false}
	let(:broken_bike){double :bike, broken?: true}
	let(:van) {double :van, bikes: [bike, broken_bike]}

	it "should accept a bike" do
		station.dock(bike)
		expect(station.bikes).to eq [bike]
	end

	it "provide a list of available bikes" do
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq [bike]
	end

	it "can release a bike" do
		station.dock(bike)
		expect{station.release(bike)}.to change{station.bikes.count}.by -1
	end

	it "can get all working bikes from a van" do
		allow(van).to receive(:release).with(bike).and_return(bike)
		station.retrieve_working_bikes_from(van)
		expect(station.bikes).to eq [bike]
	end

	

	it "should release working bikes from a van" do 
		expect(van).to receive(:release).with(bike).and_return(bike)
		station.retrieve_working_bikes_from(van)
	end

	it 'should not release a broken bike to a person' do
		station.dock(broken_bike)
	end

end