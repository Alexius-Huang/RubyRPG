require_relative '../config_helper'

module EscapeBattle
	def escape
		print "\tYou are trying to escape"
		delay
		new_line

		@monster_agility = Random.new.rand(1..@monster.agility)
		@character_agility = Random.new.rand(1..@character.agility)

		if @character_agility > @monster_agility
			puts "\tYou have successfully slipped away from the"
			puts "\t#{@monster.name}, luck you!"
			new_line
			$BATTLE_START_TOKEN = false
			return
		else
			puts "\tThe monster #{@monster.name} unfortunately"
			puts "\tcatached you!"
			new_line
			print "\tThe #{@monster.name} is ready to attack you"
			delay

			@damage = damage(@monster, @character)

			puts "\tYou've got #{@damage} damage from #{@monster.name}!" if @damage > 0
			puts "\tYou dodged the attack from #{@monster.name}!" if @damage <= 0
			@character.hp -= @damage


			if @character.hp <= 0
				puts "\tOh no! You are dead!"
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