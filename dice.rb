############################################################
#
# Name:        Jeff  Tartt
# Assignment:  Character Fight
# Date:        5/21/2014
# Class:       CIS 283
# Description: Create a rpg game
#
############################################################
class Die
	#single dice is Die
	def initialize(num_sides)
		@num_sides = num_sides
	end

	def roll
		return rand(1..@num_sides)
	end
end