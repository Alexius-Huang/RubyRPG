require_relative 'config/start'
require_relative 'config/game'
include StartEngine

#---------------------------------#
	while true
		starter_menu
		case $SELECT_TOKEN
			when 1
				include NewGame
				new_game
			when 2
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