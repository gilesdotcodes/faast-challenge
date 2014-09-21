require_relative 'passenger'

class Station

	def initialize
		@passengers = []
	end

	def passengers_in_station
		@passengers
	end

	def allow_entry(passenger)
		raise "You have insufficient funds on your Mussel Card." if passenger.mussel_balance<2
		@passengers << passenger if passenger.mussel_balance>=2
	end

	def allow_exit(passenger)
		@passengers.delete(passenger)
	end

end