
class Train

	#DEFAULT_NUMBER_OF_CARRIAGES = 8
	attr_writer :number_of_carriages
	attr_reader :passengers_onboard

	def initialize(option={})
		@passengers_onboard =[]
		self.number_of_carriages= option.fetch(:number_of_carriages, number_of_carriages)
	end

	def number_of_carriages
		@number_of_carriages ||= 8 
	end

	def capacity
		number_of_carriages * 40
	end

	def board_train (passenger)
		@passengers_onboard << passenger
	end

	def number_of_passengers_onboard
		@passengers_onboard.count
	end

end