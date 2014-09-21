require 'ticket_machine'
require 'passenger'

#chicago testing used for this at the moment, will address this

describe TicketMachine do
	let(:ticket_machine) {TicketMachine.new}
	let(:man) {Passenger.new}

	it 'should be able to top-up a Mussel Card' do
		man.money_in_ticket_machine(ticket_machine, 7)

		expect(man.mussel_balance).to eq(17)
	end

	it 'should only allow a positive top-up amount' do
		expect{ticket_machine.top_up(man, 0)}.to raise_error(RuntimeError)
	end

	it 'should not allow a passenger to spend more than they have in their wallet' do
		expect{ticket_machine.top_up(man, 40)}.to raise_error(RuntimeError)
	end
end