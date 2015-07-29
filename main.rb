############################################################
#
# Name:        Jeff  Tartt
# Assignment:  Character Fight
# Date:        5/21/2014
# Class:       CIS 283
# Description: Create a rpg game
#
############################################################

require_relative 'character'
require_relative 'dice'
require_relative 'weapons'
require_relative 'armor'

character1 = Character.new
character2 = Character.new

character1.load_character("legolas.txt")
character2.load_character("gimli.txt")

def pause
	puts "Press enter."
	gets
end

def menu(name1, name2)
	puts "1. Load Character 1 #{name1}"
	puts "2. Load Character 2 #{name2}"
	puts "3. Fight(reset characters)"
	puts "4. Player Stats"
	puts "5. Available Character Files"
	puts "6. Quit"
	print "Enter your selection:"
	puts
	return gets.chomp.to_i
end

while (user_selection = menu(":"+character1.name, ":"+character2.name)) < 6
	puts "You selected: #{user_selection}"

	if (user_selection == 1)
		puts "Enter the file name:"
		puts "example: file.txt"
		user_input = gets.chomp
		character1.load_character(user_input)

	elsif (user_selection == 2)
		puts "Enter the file name:"
		puts "example: file.txt"
		user_input = gets.chomp
		character2.load_character(user_input)

	elsif (user_selection == 3)
		character1.load_character(character1.file_name)
		character2.load_character(character2.file_name)

		agile1 = Die.new(character1.agility)
		agile2 = Die.new(character2.agility)

		agile_roll1 = agile1.roll
		agile_roll2 = agile2.roll

		#4 sided die
		d4 = Die.new(4)

		#7 sided die
		d7 = Die.new(7)

		#eight sided die
		d8 = Die.new(8)

		#10 sided die
		d10 = Die.new(10)

		#15 sided die
		d15 = Die.new(15)

		puts "#{character1.name} rolls a #{agile_roll1}"
		pause

		puts "#{character2.name} rolls a #{agile_roll2}"
		pause

		#if character 1 roll is greater than character 2 roll
		#character 1 goes first
		if (agile_roll1 > agile_roll2)
			puts "#{character1.name} goes first."
			pause

			while (character1.hit_points > 0) || (character2.hit_points > 0)
				if (d10.roll < character2.agility)

					hit = (character1.strength * (1.0/d4.roll) + (character1.weapons.hits)/d8.roll).to_i
					armor_save = (character2.armor.hits/d15.roll).to_i
					current_hits = (hit - armor_save)

					if (current_hits < 0)
						current_hits = current_hits * -1
					end

					character2.hit_points = character2.hit_points - current_hits

					puts "#{character1.name} deals #{current_hits} damage"
					puts

					if (character2.hit_points <= 0)
						character2.hit_points = 0
						puts "#{character2.name}'s health is #{character2.hit_points}"
						puts "#{character2.name} died in excruciating agony!"
						pause
						puts "Game Over"
						puts
						break
					else
						puts "#{character2.name}'s health is #{character2.hit_points}"
					end

					pause
				else
					puts "#{character1.name} misses..."
					pause

					hit = (character2.strength * (1.0/d4.roll) + (character2.weapons.hits)/d8.roll).to_i
					armor_save = (character1.armor.hits/d15.roll).to_i
					current_hits = (hit - armor_save)

					if (current_hits < 0)
						current_hits = current_hits * -1
					end
					character1.hit_points = character1.hit_points - current_hits

					puts "#{character2.name} strikes and deals #{current_hits} damage"
					puts


					if (character1.hit_points <= 0)
						character1.hit_points = 0
						puts "#{character1.name}'s health is #{character1.hit_points}"
						puts "#{character1.name} was brutally mutilated!!"
						pause
						puts "Game Over"
						puts
						break
					else
						puts "#{character1.name}'s health is #{character1.hit_points}"
					end

					pause
				end
				#end roll

			end
			#end while loop

			#if character 2 roll is greater than character 1 roll
			#character 2 goes first
		elsif (agile_roll2 > agile_roll1)
			puts "#{character2.name} goes first."
			pause

			while (character1.hit_points > 0) || (character2.hit_points > 0)

				if (d10.roll < character1.agility)

					hit = (character2.strength * (1.0/d4.roll) + (character2.weapons.hits)/d8.roll).to_i
					armor_save = (character1.armor.hits/d15.roll).to_i

					current_hits = (hit - armor_save)
					if (current_hits < 0)
						current_hits = current_hits * -1
					end

					character1.hit_points = character1.hit_points - current_hits

					puts "#{character2.name} deals #{current_hits} damage"
					puts

					if (character1.hit_points <= 0)
						character1.hit_points = 0
						puts "#{character1.name}'s health is #{character1.hit_points}"
						puts "#{character1.name} was slaughtered with no remorse!"
						pause
						puts "Game Over"
						puts
						break
					else
						puts "#{character1.name}'s health is #{character1.hit_points}"
					end

					pause
				else
					puts "#{character2.name} misses..."
					pause

					hit = (character1.strength * (1.0/d4.roll) + (character1.weapons.hits)/d8.roll).to_i
					armor_save = (character2.armor.hits/d15.roll).to_i

					current_hits = (hit - armor_save)
					if (current_hits < 0)
						current_hits = current_hits * -1
					end

					character2.hit_points = character2.hit_points - current_hits

					puts "#{character1.name} strikes and deals #{current_hits} damage"
					puts

					if (character2.hit_points <= 0)
						character2.hit_points = 0
						puts "#{character2.name}'s health is #{character2.hit_points}"
						puts "#{character2.name}'s head was chopped off!"
						pause
						puts "Game Over"
						puts
						break
					else
						puts "#{character2.name}'s health is #{character2.hit_points}"
					end

					pause
				end
				#end roll

			end
			#end while loop
		else
			puts "Tie, restart game"
		end
		#end agile roll condition
	elsif (user_selection == 4)
		puts character1
		puts
		puts character2
		puts
	elsif(user_selection == 5)
		puts "legolas.txt\ngimli.txt\nyoda.txt\nvader.txt"
		puts
	end
	#end menu selections
end
#end menu loop
