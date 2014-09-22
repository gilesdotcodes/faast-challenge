require_relative 'passenger'

class TicketMachine

	def top_up(passenger, amount)
		money_check(passenger, amount)
		amount
	end

	def money_check(passenger, amount)
		raise "You have not put any money into the machine." if amount<=0
		raise "You cannot afford to add this much money." if passenger.wallet_balance<amount
	end

end