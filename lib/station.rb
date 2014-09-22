require_relative 'passenger'

class Station

	attr_reader :passengers

	def initialize
		@passengers = []
	end

	def allow_entry(passenger)
		raise "You have insufficient funds on your Mussel Card." if passenger.mussel_balance<2
		@passengers << passenger
		passenger.mussel_balance =  passenger.mussel_balance - 2
		
	end

	def allow_exit(passenger)
		@passengers.delete(passenger)
	end


	def release_to_train(passenger, train)
		train.board_train(passenger)
		@passengers.delete(passenger) if train.board_train(passenger) != RuntimeError
	end

	def receive_from_train(passenger, train)
		train.unboard_train(passenger)
		@passengers << passenger
	end

end