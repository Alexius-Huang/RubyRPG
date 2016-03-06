require_relative '../../config_helper'
require_relative 'escape_battle'
require_relative 'monster'
require_relative 'battle_helper'
require 'colorize'

module MonsterFight
	include BattleHelper
	def monster_fight
		load_monster

		@character = $CHARACTER
	
		puts "\tHere comes a #{@monster.name.light_magenta}!"
		new_line

		bar_length = 48
		while $BATTLE_START_TOKEN
			display_scene

			option_list(4,
				"Attack #{@monster.name.light_magenta}",
				"Use Skill",
				"Use Potion",
				"Try Escape"
			)
			case $SELECT_TOKEN
				when 1
					battle
				when 2
				when 3
				when 4
					include EscapeBattle
					escape
			end
		end
	end
end
