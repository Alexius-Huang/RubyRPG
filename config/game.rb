require_relative 'config_helper'
require_relative 'game/explore'
require_relative 'game/character'

module NewGame
	def new_game
		story
		# Setup character's parameters
		puts "\tEnter your character's name ~"
		print "\t>>> "
		character_name = gets.chomp!
		$CHARACTER = Character.new(character_name, 20, 5, 0, 5, 3)
		$CHARACTER_MAX_HP = 20
		$CHARACTER_MAX_MP = 5
		$CHARACTER_MAX_EXP = 0
		$CHARACTER_ATTACK = 5
		$CHARACTER_DEFENSE = 3
		$PROCESS_GAME_TOKEN = true
		new_line
	end

	def story
		striped_line
		puts "\t Once upon a time ..."
		striped_line
		new_line
	end
end

module ProcessGame
	def process
		while true
			striped_line
			show_current_state
			striped_line
			option_list( 4,
				"Explore",
				"Look At Inventory",
				"Save Record",
				"Exit Game"
			)
			case $SELECT_TOKEN
				when 1
					include Explore
					random_token_generator(1..100)
					explore
				when 2
				when 3
				when 4
					puts "\tBye Bye ~!"
					$PROCESS_GAME_TOKEN = false
					$QUIT_GAME_TOKEN = true
					break
			end
		end
	end

	def show_current_state
		puts "\t#{$CHARACTER.name}"
		puts "\tHP  | #{$CHARACTER.hp}"
		puts "\tMP  | #{$CHARACTER.hp}"
		puts "\tEXP | #{$CHARACTER.exp}"
	end

end
