require_relative '../config_helper'
require_relative 'monster'
require_relative 'escape_battle'
require 'colorize'

module MonsterFight
	def monster_fight
		random_token_generator(0..1)
		@monster = $MONSTER_DATABASE[$RANDOM_TOKEN]
		@character = $CHARACTER
		dialogue
	end

	def dialogue
		puts "\tHere comes a #{@monster.name}!"
		new_line
		while $BATTLE_START_TOKEN
			striped_line
			puts "\t#{@monster.name.yellow}"
			puts "\tHP  | #{@monster.hp}"
			puts "\tMP  | #{@monster.mp}"
			puts "\t#{@character.name.yellow}"
			puts "\tHP  | #{@character.hp}"
			puts "\tMP  | #{@character.mp}"
			striped_line

			option_list(3,
				"Attack #{@monster.name}",
				"Defense",
				"Try Escape"
			)
			case $SELECT_TOKEN
				when 1
					battle
				when 2
				when 3
					include EscapeBattle
					escape
			end
		end
	end

#------------------- Separate Line -------------------#

	def battle
		print "\tYou are trying to attack #{@monster.name}"
		@damage = damage(@character, @monster)
		delay
		puts "\tYou caused #{@damage} damage on #{@monster.name}!" if @damage > 0
		puts "\tThe monster does not being harm..." if @damage <= 0
		@monster.hp -= @damage
		
		if @monster.hp <= 0
			puts "\tThe #{@monster.name} is dead!"
			puts "\tYou gained #{@monster.exp} EXP point!"
			@character.exp += @monster.exp
			new_line

			refresh_monster_data
			$BATTLE_START_TOKEN = false
			return
		end
		
		sleep 0.5

		print "\t#{@monster.name} is ready attacking you."
		@damage = damage(@monster, @character)
		delay
		puts "\tYou've got #{@damage} damage from #{@monster.name}!" if @damage > 0
		puts "\tYou dodged the attack from #{@monster.name}!" if @damage <= 0 
		@character.hp -= @damage

		if @character.hp <= 0
			puts "\tOh no! You are dead!"
			raise CharacterDeadError
		end

		new_line
	end

	def damage(active, passive)
		d = (active.attack * Random.new.rand(0.6..1.0)) - (passive.defense * Random.new.rand(0.6..1.0))
		return 0 if d < 0
		return d.to_i
	end

	def refresh_monster_data
		@monster.hp = $MONSTERS[$RANDOM_TOKEN][0]
		@monster.mp = $MONSTERS[$RANDOM_TOKEN][1]
	end
end
