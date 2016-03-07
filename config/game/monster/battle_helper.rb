require_relative '../game_attribute/level_controller'

module BattleHelper
	def load_monster
		random_token_generator(0..1)
		$CURRENT_MONSTER = $MONSTER_DATABASE[$RANDOM_TOKEN]

		@monster_name = $CURRENT_MONSTER[0]
		@monster_hp = @monster_max_hp = $CURRENT_MONSTER[1]
		@monster_mp = @monster_max_mp = $CURRENT_MONSTER[2]
		@monster_exp = $CURRENT_MONSTER[3]
		@monster_attack = $CURRENT_MONSTER[4]
		@monster_defense = $CURRENT_MONSTER[5]
		@monster_agility = $CURRENT_MONSTER[6]
		@monster_money = $CURRENT_MONSTER[7]
		@monster_max_mp = 1 if @monster_max_mp == 0


		@monster = Monster.new(
			@monster_name,
			@monster_hp,
			@monster_mp,
			@monster_exp,
			@monster_attack,
			@monster_defense,
			@monster_agility,
			@monster_money
		)
	end	

	def battle
		print "\tYou".light_yellow + " are trying to attack #{@monster.name.light_magenta}"
		@damage = damage(@character, @monster)
		delay
		puts "\tYou".light_yellow + " caused #{@damage.to_s.light_red} damage on #{@monster.name.light_magenta}!" if @damage > 0
		puts "\tThe monster does not being harm..." if @damage <= 0
		@monster.hp -= @damage
		
		if @monster.hp <= 0
			puts "\tThe #{@monster.name.light_magenta} is dead!"
			battle_award

			#refresh_monster_data
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

#	def refresh_monster_data
#		@monster.hp = $MONSTERS[$RANDOM_TOKEN][0]
#		@monster.mp = $MONSTERS[$RANDOM_TOKEN][1]
#	end

	def battle_award
		puts "\tYou".light_yellow + " gained" + " #{@monster.exp.to_s} EXP points".light_green + " !"
		@character.exp += @monster.exp
		puts "\tYou".light_yellow + " gained" + " $ #{@monster.money.to_s}".light_yellow + " !"
		@character.money = $CHARACTER_MONEY += @monster.money
		new_line

		if @character.exp >= $CHARACTER_MAX_EXP
			include LevelController
			level_up
		end
	end

	def display_scene(bar_length = 48)
		striped_line
		puts "\t<<< #{@monster.name.light_magenta} >>>"
		puts "\tHP  | #{@monster.hp.to_s.light_red}"
		display_bar(bar_length, @monster.hp, @monster_max_hp, "light_red")
		puts "\tMP  | #{@monster.mp.to_s.blue}"
		display_bar(bar_length, @monster.mp, @monster_max_mp, "blue")
		striped_line
		new_line
		striped_line
		puts "\t<<< #{@character.name.light_yellow} >>>"
		puts "\tHP  | #{@character.hp.to_s.light_red}"
		display_bar(bar_length, @character.hp, $CHARACTER_MAX_HP, "light_red")
		puts "\tMP  | #{@character.mp.to_s.blue}"
		display_bar(bar_length, @character.mp, $CHARACTER_MAX_MP, "blue")
		striped_line
	end

	def display_bar(bar_length, numerator, denominator, color)
		bar = ( Rational(numerator, denominator) * bar_length ).to_i
		bar_space = bar_length - bar
		case color
			when "light_red"
				puts "\t[" + "|".light_red * bar + " " * bar_space + "]"
			when "blue"
				puts "\t[" + "|".blue * bar + " " * bar_space + "]"	
			when "light_green"
				puts "\t[" + "|".light_green * bar + " " * bar_space + "]"
		end
	end
end