require_relative 'battle_helper'

module Battle
	def battle
		system 'clear'
		new_line

		character_attack
		return unless $BATTLE_START_TOKEN		
		
		sleep 0.5

		monster_attack

		new_line
	end

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
		@monster_critical_attack_rate = $CURRENT_MONSTER[7]
		@monster_luck = $CURRENT_MONSTER[8]
		@monster_money = $CURRENT_MONSTER[9]
		@monster_max_mp = 1 if @monster_max_mp == 0


		@monster = Monster.new(
			@monster_name,
			@monster_hp,
			@monster_mp,
			@monster_exp,
			@monster_attack,
			@monster_defense,
			@monster_agility,
			@monster_critical_attack_rate,
			@monster_luck,
			@monster_money
		)
	end	

end