require 'station'

describe Station do

	let(:station) {Station.new}
	let(:passenger) {double :passenger, mussel_balance: 2}
	let(:train) {double :train}

	it 'should know who is in the station' do
		expect(station.passengers).to eq([])
	end

	it 'should only be able to receive a passenger if they have credit on Mussel Card' do 
		allow(passenger).to receive(:mussel_balance=)
		station.allow_entry(passenger)		

		expect(station.passengers.count).to eq(1)	
	end

	it 'should raise an error if passenger has insufficient credit' do
		allow(passenger).to receive(:mussel_balance).and_return(1)

		expect{station.allow_entry(passenger)}.to raise_error(RuntimeError)
	end

	it 'should allow a person to leave when they disembark a train' do
		allow(passenger).to receive(:mussel_balance=)
		station.allow_entry(passenger)
		station.allow_exit(passenger)

		expect(station.passengers.count).to eq(0)
	end	

	it 'should reduce Mussel Balance by £2 after touching in' do
		allow(passenger).to receive(:mussel_balance=).and_return(2)

		expect(station.allow_entry(passenger)).to eq(0)
	end	

	it 'should release passenger from station when they board the train' do
		allow(passenger).to receive(:mussel_balance=)
		station.allow_entry(passenger)
		allow(train).to receive(:board_train)

		expect{station.release_to_train(passenger, train)}.to change{station.passengers.count}.by(-1)
	end

	it 'should receive passenger from train when they disembark' do
		allow(passenger).to receive(:mussel_balance=)
		station.allow_entry(passenger)
		allow(train).to receive(:unboard_train)

		expect{station.receive_from_train(passenger, train)}.to change{station.passengers.count}.by(1)
	end

end