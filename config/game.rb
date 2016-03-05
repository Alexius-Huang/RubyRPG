require_relative 'config_helper'
require_relative 'game/explore'
require_relative 'game/character'

module NewGame
	def new_game
		story
		# Setup character's parameters
		puts "\tEnter your character's name ~"
		print "\t>>> "

		$CHARACTER = Character.new(gets.chomp!, 20, 5, 0, 5, 3)
		$CHARACTER_MAX_HP = $CHARACTER_HP = 20
		$CHARACTER_MAX_MP = $CHARACTER_MP = 5
		$CHARACTER_MAX_EXP = $CHARACTER_EXP = 0

		$CHARACTER = Character.new(gets.chomp, 20, 5, 0, 5, 3)
		$CHARACTER_MAX_HP = 20
		$CHARACTER_MAX_MP = 5
		$CHARACTER_MAX_EXP = 0
		$CHARACTER_ATTACK = 5
		$CHARACTER_DEFENSE = 2
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
		loop do
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
				when 2, 3, 4
					puts "\tBye Bye ~!"
					$PROCESS_GAME_TOKEN = false
					$QUIT_GAME_TOKEN = true
			end
		end
	end

	def show_current_state
		puts "\t#{$CHARACTER.name}"
		puts "\tHP  | #{$CHARACTER.hp}"
		puts "\tMP  | #{$CHARACTER.mp}"
		puts "\tEXP | #{$CHARACTER.exp}"
	end

end
