require 'ticket_machine'

describe TicketMachine do
	let(:ticket_machine) {TicketMachine.new}
	let(:passenger) {double :passenger}

	it 'should be able to top-up a Mussel Card' do
		allow(passenger).to receive(:wallet_balance).and_return(10)

		expect(ticket_machine.top_up(passenger, 7)).to eq(7)
	end

	it 'should only allow a positive top-up amount' do
		expect{ticket_machine.top_up(:passengerman, 0)}.to raise_error(RuntimeError)
	end

	it 'should not allow a passenger to spend more than they have in their wallet' do
		allow(passenger).to receive(:wallet_balance).and_return(5)

		expect{ticket_machine.top_up(passenger, 40)}.to raise_error(RuntimeError)
	end
end