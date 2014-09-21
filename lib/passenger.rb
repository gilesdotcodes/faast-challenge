require_relative 'ticket_machine'

class Passenger

	DEFAULT_BALANCE = 10

	attr_writer :mussel_balance, :wallet_balance

	def initialize(option={})
		self.mussel_balance = option.fetch(:mussel_balance, mussel_balance)
		self.wallet_balance = option.fetch(:wallet_balance, wallet_balance)
	end

	def mussel_balance
		@mussel_balance ||= DEFAULT_BALANCE
	end

	def wallet_balance
		@wallet_balance ||= DEFAULT_BALANCE
	end

	def money_in_ticket_machine(ticket_machine, amount)
		@mussel_balance = ticket_machine.top_up(self, amount)
		@wallet_balance = wallet_balance - amount
	end

end