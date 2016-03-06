require_relative 'config_helper'
require_relative 'game/game_helper'
require_relative 'game/explore'
require_relative 'game/character'
require_relative 'game/game_record/save_record'
require_relative 'game/game_record/load_record'
require 'colorize'

module NewGame
	def new_game
		story
		# Setup character's parameters
		puts "\tEnter your character's name ~"
		print "\t>>> "

		$CHARACTER = Character.new(gets.chomp, 20, 5, 0, 5, 2, 3)
		$CHARACTER_LEVEL = 1
		$CHARACTER_MAX_HP = 20
		$CHARACTER_MAX_MP = 5
		$CHARACTER_MAX_EXP = 10
		$CHARACTER_ATTACK = 5
		$CHARACTER_DEFENSE = 2
		$CHARACTER_AGILITY = 3
		
		$PROCESS_GAME_TOKEN = true

		path_name = "./config/game/game_record/player_records"
		$RECORD_ID = Dir.new(path_name).count - 1
		$RECORD_FILE_NAME = "player_#{$RECORD_ID}.txt"

		new_line
	end

	def story
		striped_line
		puts "\t Once upon a time ..."
		striped_line
		new_line
	end
end

module LoadGame
	def load_game
		path_name = "./config/game"
		print "\tFinding records"
		delay
		new_line

		@record_files = []
		directory = Dir.new($RECORD_FOLDER_PATH)
		directory.each { |f| @record_files << f unless ( f == "." || f == ".." ) }

		unless @record_files.any?
			puts "\tOops, there appears no records at all!"
			return
		else
			include LoadRecord
			load_record
		end
	end
end

module ProcessGame
	include GameHelper
	def process
		while $PROCESS_GAME_TOKEN
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
					include SaveRecord
					save_record
				when 4
					puts "\tBye Bye ~!"
					new_line
					$PROCESS_GAME_TOKEN = false
					$QUIT_GAME_TOKEN = true
			end
		end
	end
end



