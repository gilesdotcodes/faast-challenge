
class Train

	#DEFAULT_NUMBER_OF_CARRIAGES = 8
	attr_writer :number_of_carriages

	def initialize(option={})
		self.number_of_carriages= option.fetch(:number_of_carriages, number_of_carriages)
	end

	def number_of_carriages
		@number_of_carriages ||= 8 
	end

end