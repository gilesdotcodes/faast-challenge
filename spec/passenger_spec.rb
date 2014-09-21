require 'passenger'

describe Passenger do

	let(:passenger) {Passenger.new}

	it 'should have default balance on Mussel Card of £10' do
		expect(passenger.mussel_balance).to eq(10)
	end

	it 'should be able to set new balance on Mussel Card when created' do
		passenger_rich = Passenger.new({mussel_balance: 200})
		expect(passenger_rich.mussel_balance).to eq(200)
	end

	it 'should be able to check balance on Mussel Card' do
		passenger.mussel_balance = 40
		expect(passenger.mussel_balance).to eq(40)
	end

	it 'should have default cash balance in their Wallet' do
		expect(passenger.wallet_balance).to eq(10)
	end

	it 'should be able to set new balance in their Wallet when created' do
		passenger_rich = Passenger.new({wallet_balance: 300})
		expect(passenger_rich.wallet_balance).to eq(300)
	end

	it 'should be able to check balance in Wallet' do
		passenger.wallet_balance = 67
		expect(passenger.wallet_balance).to eq(67)
	end


end