require_relative '../config_helper'
require_relative 'monster/monster_fight'

module Explore
	def explore
		system 'clear'
		new_line
		case $RANDOM_TOKEN
			when  1...33
				include MonsterFight
				$BATTLE_START_TOKEN = true
				monster_fight
			when 33...66
			# find_treasure
			when 66..100
				puts "\tNothing Happen..."
				new_line
		end
	end
end