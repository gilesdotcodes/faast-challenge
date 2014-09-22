require 'passenger'

describe Passenger do

	let(:passenger) {Passenger.new}
	let(:passenger_rich) {Passenger.new({mussel_balance: 200, wallet_balance: 300})}
	let(:ticket_machine) {double :ticket_machine}

	it 'should have default balance on Mussel Card of £10' do
		expect(passenger.mussel_balance).to eq(10)
	end

	it 'should be able to set new balance on Mussel Card when created' do
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
		expect(passenger_rich.wallet_balance).to eq(300)
	end

	it 'should be able to check balance in Wallet' do
		passenger.wallet_balance = 67
		expect(passenger.wallet_balance).to eq(67)
	end

	it 'should be able to add money to Mussel Card' do
		allow(ticket_machine).to receive(:top_up).and_return(6)
		passenger.money_in_ticket_machine(ticket_machine, 6)

		expect(passenger.mussel_balance).to eq(16)
	end

	it 'should remove money from wallet when adding to Mussel Card' do
		allow(ticket_machine).to receive(:top_up).and_return(6)
		passenger.money_in_ticket_machine(ticket_machine, 6)

		expect(passenger.wallet_balance).to eq(4)
	end

	it 'should return money back to Wallet if top-up fails' do
		allow(ticket_machine).to receive(:top_up).and_return(RuntimeError)
		passenger.money_in_ticket_machine(ticket_machine, 100)

		expect(passenger.wallet_balance).to eq(10)
	end


end