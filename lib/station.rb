require_relative 'passenger'

class Station

	def initialize
		@passengers = []
	end

	def passengers_in_station
		@passengers
	end

	def allow_entry(passenger)
		@passengers << passenger if passenger.mussel_balance>=2
	end

end