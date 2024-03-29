require_relative 'config_helper'
require_relative 'game/game_helper'
require_relative 'game/explore'
require_relative 'game/character'
require_relative 'game/inventory'
require_relative 'game/game_items/potion'
require_relative 'game/game_record/save_record'
require_relative 'game/game_record/load_record'
require_relative 'game/game_attribute/level_controller'
require 'colorize'

module NewGame
	def new_game
		include LevelController

		story
		# Setup character's parameters
		puts "\tEnter your character's name ~"
		print "\t>>> "

		$CHARACTER = Character.new(gets.chomp, 50, 10, 0, 10, 5, 7, 120, 3.0, 100)
		$CHARACTER_LEVEL = 1
		$CHARACTER_MAX_HP = 50
		$CHARACTER_MAX_MP = 10
		$CHARACTER_MAX_EXP = require_exp($CHARACTER_LEVEL)
		$CHARACTER_ATTACK = 12
		$CHARACTER_DEFENSE = 7
		$CHARACTER_AGILITY = 5
		$CHARACTER_CRITICAL_ATTACK_RATE = 120
		$CHARACTER_LUCK = 3.0
		$CHARACTER_MONEY = $CHARACTER.money

		$CHARACTER_INVENTORY = []
		push_item $POTION_DATABASE[0]
		push_item $POTION_DATABASE[1]
		
		$PROCESS_GAME_TOKEN = true

		path_name = "./config/game/game_record/player_records"
		$RECORD_ID = Dir.new(path_name).count - 1
		$RECORD_FILE_NAME = "player_#{$RECORD_ID}.txt"
		$RECORD_INVENTORY_ITEMS_FILE_NAME = "player_items_#{$RECORD_ID}.txt"

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

		@record_item_files = []
		directory = Dir.new($RECORD_ITEMS_FOLDER_PATH)
		directory.each { |f| @record_item_files << f unless ( f == "." || f == "..") }

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
					include Inventory
					view_inventory
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



