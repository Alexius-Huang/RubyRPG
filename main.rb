require_relative 'config/start'
require_relative 'config/game'
require_relative './config/config_helper'
include StartEngine

system 'clear'
new_line

#---------------------------------#
	while true
		starter_menu
		$RECORD_FOLDER_PATH = "./config/game/game_record/player_records"
		$RECORD_ITEMS_FOLDER_PATH = "./config/game/game_record/player_items_records"
		$LOAD_GAME_TOKEN = false
		system "clear" 
		new_line
		case $SELECT_TOKEN
			when 1
				include NewGame
				new_game
			when 2
				include LoadGame
				$LOAD_GAME_TOKEN = true
				load_game
			when 3
				exit
		end

		if $PROCESS_GAME_TOKEN
			include ProcessGame
			process
		end

		break if $QUIT_GAME_TOKEN
	end
#---------------------------------#