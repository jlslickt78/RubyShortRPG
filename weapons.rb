############################################################
#
# Name:        Jeff  Tartt
# Assignment:  Character Fight
# Date:        5/21/2014
# Class:       CIS 283
# Description: Create a rpg game
#
############################################################
class Weapons
	attr_accessor :name, :hits

	def initialize(name, hits)
		@name = name
		@hits = hits
	end

	def to_s
		return "Weapon Name: #{@name}, Hits: #{@hits}"
	end
end