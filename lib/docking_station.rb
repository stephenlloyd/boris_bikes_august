class DockingStation
	def initialize
		#sets an instance varialbe called bikes to the value of an empty array
		@bikes = []
	end

	# a method which takes a bike as an argument.
	def dock(bike)
		# shovels the bike variable into a method called bikes
		bikes << bike
	end

	def bikes
		@bikes
	end

	def available_bikes
		bikes.reject{|bike|bike.broken?}
	end

end