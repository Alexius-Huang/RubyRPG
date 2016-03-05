require_relative '../config_helper'

module EscapeBattle
	def escape
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
			puts "\tThe monster #{@monster.name.light_magenta} unfortunately"
			puts "\tcatched " + "you".light_yellow + "!"
			new_line
			print "\tThe #{@monster.name.light_magenta} is ready to attack you"
			delay

			@damage = damage(@monster, @character)

			puts "\tYou".light_yellow + "'ve got #{@damage.to_s.light_red} damage from #{@monster.name.light_magenta}!" if @damage > 0
			puts "\tYou".light_yellow + " dodged the attack from #{@monster.name.light_magenta}!" if @damage <= 0
			@character.hp -= @damage


			if @character.hp <= 0
				puts "\tOh no! You are dead!".light_red
				raise CharacterDeadError
			end
		end
		
		new_line
	end

	def damage(active, passive)
		d = (active.attack * Random.new.rand(0.6..1.0)) - (passive.defense * Random.new.rand(0.6..1.0))
		return 0 if d < 0
		return d.to_i
	end
end