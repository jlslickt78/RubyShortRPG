############################################################
#
# Name:        Jeff  Tartt
# Assignment:  Character Fight
# Date:        5/21/2014
# Class:       CIS 283
# Description: Create a rpg game
#
############################################################
class Character
	require_relative 'weapons'
	require_relative 'armor'

	attr_accessor :name, :race, :hit_points, :strength, :agility, :weapons, :armor, :file_name

	def initialize
		@name = name
		@race = race
		@hit_points = hit_points
		@strength = strength
		@agility = agility
		@weapons
		@armor
		@file_name
	end

	def load_character(new_file)
		@file_name = new_file
		character_file = File.readlines(new_file)
		character = character_file[0].chomp.split(",")

		weapons = character_file[1].chomp.split(",")

		armor = character_file[2].chomp.split(",")

		@name = character[0]
		@race = character[1]
		@hit_points = character[2].to_i
		@strength = character[3].to_i
		@agility = character[4].to_i

		@weapons = Weapons.new(weapons[0], weapons[1].to_i)
		@armor = Armor.new(armor[0], armor[1].to_i)

	end

	def to_s
		return  "Name: #{@name}, Race: #{@race}, Hit Points: #{@hit_points}, Strength: #{@strength}, Agility: #{@agility}\n#{@weapons}\n#{@armor}"
	end

end