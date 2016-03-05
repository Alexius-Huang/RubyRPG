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
		puts "\tHere comes a #{@monster.name.light_magenta}!"
		new_line
		while $BATTLE_START_TOKEN
			striped_line
			puts "\t<<< #{@monster.name.light_magenta} >>>"
			puts "\tHP  | #{@monster.hp.to_s.light_red}"
			puts "\tMP  | #{@monster.mp.to_s.blue}"
			puts "\t<<< #{@character.name.light_yellow} >>>"
			puts "\tHP  | #{@character.hp.to_s.light_red}"
			puts "\tMP  | #{@character.mp.to_s.blue}"
			striped_line

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

#------------------- Separate Line -------------------#

	def battle
		print "\tYou".light_yellow + " are trying to attack #{@monster.name.light_magenta}"
		@damage = damage(@character, @monster)
		delay
		puts "\tYou".light_yellow + " caused #{@damage.to_s.light_red} damage on #{@monster.name.light_magenta}!" if @damage > 0
		puts "\tThe monster does not being harm..." if @damage <= 0
		@monster.hp -= @damage
		
		if @monster.hp <= 0
			puts "\tThe #{@monster.name.light_magenta} is dead!"
			puts "\tYou".light_yellow + " gained #{@monster.exp.to_s.light_green} EXP point!"
			@character.exp += @monster.exp
			new_line

			refresh_monster_data
			$BATTLE_START_TOKEN = false
			return
		end
		
		sleep 0.5

		print "\t#{@monster.name.light_magenta} is ready attacking " + "you".light_yellow + "."
		@damage = damage(@monster, @character)
		delay
		puts "\tYou".light_yellow + "'ve got #{@damage.to_s.light_red} damage from #{@monster.name.light_magenta}!" if @damage > 0
		puts "\tYou".light_yellow + " dodged the attack from #{@monster.name.light_magenta}!" if @damage <= 0 
		@character.hp -= @damage

		if @character.hp <= 0
			puts "\tOh no! You are dead!".light_red
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
