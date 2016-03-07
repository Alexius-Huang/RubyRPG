module LevelController
	def level_up
		$CHARACTER_LEVEL += 1
		$CHARACTER_MAX_EXP = require_exp($CHARACTER_LEVEL)
		level_up_refresh_attributes
		level_up_message
	end

	def require_exp(level)
		10 * ( level ** 3 + level ** 2 + level )
	end

	def level_up_refresh_attributes
		$CHARACTER.exp -= require_exp($CHARACTER_LEVEL - 1)
		$CHARACTER.hp = $CHARACTER_MAX_HP
		$CHARACTER.mp = $CHARACTER_MAX_MP
	end

	def level_up_message
		new_line
		striped_line
		new_line
		
		puts "\tCongratulation!".blue + " You have level up to " + "#{$CHARACTER_LEVEL} ".light_yellow + "!!!"
		
		new_line
		striped_line
		new_line
	end
end