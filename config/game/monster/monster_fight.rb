require_relative '../../config_helper'
require_relative 'escape_battle'
require_relative 'monster'
require_relative 'battle_helper'
require 'colorize'

module MonsterFight

	def monster_fight
		random_token_generator(0..1)
		@monster = $MONSTER_DATABASE[$RANDOM_TOKEN]
		@monster_max_hp = $MONSTERS[$RANDOM_TOKEN][0]
		@monster_max_mp = $MONSTERS[$RANDOM_TOKEN][1]
		@monster_max_mp = 1 if @monster_max_mp == 0
		@character = $CHARACTER
	
		puts "\tHere comes a #{@monster.name.light_magenta}!"
		new_line

		bar_length = 48
		while $BATTLE_START_TOKEN
			include BattleHelper
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
