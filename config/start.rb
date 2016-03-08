require_relative 'config_helper'

module StartEngine
	def starter_menu
		new_line
		striped_line
		puts "\t\t Welcome to the Adventure World!" + "\n"
		striped_line
		new_line

		option_list(3, 
			"Start New Adventure", 
			"Load Game", 
			"Exit"
		)
		# The selection will stored in $SELECT_TOKEN

		new_line
	end

	def exit
		system 'clear'
		new_line

		puts "\tBye Bye ~!"
		new_line
		$QUIT_GAME_TOKEN = true
	end
end