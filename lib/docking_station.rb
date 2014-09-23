class DockingStation
	def initialize
		@bikes = []
	end

	# attr_writer(:bikes, :broken_bikes)

	# def bikes=(bikes)
	# 	@bikes = bikes
	# end

	def dock(bike)
		bikes << bike
	end

	def bikes
		@bikes
	end

	def available_bikes
		bikes.reject{|bike|bike.broken?}
	end

	def release(bike)
		bikes.delete(bike)
	end

	def retrieve_working_bikes_from(container)
		container.bikes.each {|bike| dock(container.release(bike)) unless bike.broken?}
	end

end