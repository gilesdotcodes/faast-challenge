require_relative 'passenger'

class TicketMachine

	def top_up(passenger, amount)
		raise "You have not put any money into the machine." if amount<=0
		raise "You cannot afford to add this much money." if passenger.wallet_balance<amount
		passenger.mussel_balance= passenger.mussel_balance + amount
	end

end