require 'bike'

describe Bike do
	let(:bike){Bike.new}

	context "on initialization" do
		it "should not be broken" do
			expect(bike.broken?).to eq false
		end
	end

	it "can be broken" do
		expect(bike.break!.broken?).to eq true
	end

	it "can be fixed" do
		expect(bike.break!.fix!.broken?).to eq false 
	end
end



