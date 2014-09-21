require 'station'

describe Station do

	let(:station) {Station.new}

	it 'should know who is in the station' do
		expect(station.passengers_in_station).to eq([])
	end

	it 'should only be able to receive a passenger if they have credit on Mussel Card' do 
		passenger = double :passenger
		allow(passenger).to receive(:mussel_balance).and_return(2)
		station.allow_entry(passenger)

		expect(station.passengers_in_station.count).to eq(1)	
	end
	
end