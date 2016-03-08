require_relative '../../config_helper'
require_relative 'battle_helper'

module EscapeBattle
	def escape
		system 'clear'
		new_line

		print "\tYou".light_yellow + " are trying to escape"
		delay
		new_line

		@monster_agility = Random.new.rand(1..@monster.agility)
		@character_agility = Random.new.rand(1..@character.agility)

		if @character_agility > @monster_agility
			puts "\tYou".light_yellow + " have successfully slipped away from the"
			puts "\t#{@monster.name.light_magenta}, lucky " + "you".light_yellow + "!"
			new_line
			$BATTLE_START_TOKEN = false
			return
		else
			include BattleHelper
			puts "\tThe monster #{@monster.name.light_magenta} unfortunately"
			puts "\tcatched " + "you".light_yellow + "!"
			new_line
			monster_attack
		end
		
		new_line
	end

end