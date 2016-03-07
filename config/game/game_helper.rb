module GameHelper

	def show_current_state
		puts "\t " + "LEVEL #{$CHARACTER_LEVEL}".light_yellow + "  <<< #{$CHARACTER.name.light_yellow} >>>"

		hp_display_length = $CHARACTER.hp.to_s.length + 1 + $CHARACTER_MAX_HP.to_s.length
		mp_display_length = $CHARACTER.mp.to_s.length + 1 + $CHARACTER_MAX_MP.to_s.length
		exp_display_length = $CHARACTER.exp.to_s.length + 1 + $CHARACTER_MAX_EXP.to_s.length
		attack_display_length = $CHARACTER_ATTACK.to_s.length
		defense_display_length = $CHARACTER_DEFENSE.to_s.length
		agility_display_length = $CHARACTER_AGILITY.to_s.length
		money_display_length = $CHARACTER_MONEY.to_s.length

		hp_space_display_length = 40 - hp_display_length
		mp_space_display_length = 40 - mp_display_length
		exp_space_display_length = 40 - exp_display_length
		attack_space_display_length = 40 - attack_display_length
		defense_space_display_length = 40 - defense_display_length
		agility_space_display_length = 40 - agility_display_length
		money_space_display_length = 40 - money_display_length

		bar_length = 48

		puts "\tHP       |" + " " * hp_space_display_length + "#{$CHARACTER.hp.to_s.light_red}/#{$CHARACTER_MAX_HP}"
		display_bar(bar_length, $CHARACTER.hp, $CHARACTER_MAX_HP, "light_red")

		puts "\tMP       |" + " " * mp_space_display_length + "#{$CHARACTER.mp.to_s.blue}/#{$CHARACTER_MAX_MP}"
		display_bar(bar_length, $CHARACTER.mp, $CHARACTER_MAX_MP, "blue")

		puts "\tEXP      |" + " " * exp_space_display_length + "#{$CHARACTER.exp.to_s.light_green}/#{$CHARACTER_MAX_EXP}"
		display_bar(bar_length, $CHARACTER.exp, $CHARACTER_MAX_EXP, "light_green")

		puts "\tATTACK   |" + " " * attack_space_display_length + "#{$CHARACTER_ATTACK.to_s.red}"
		puts "\tDEFENSE  |" + " " * defense_space_display_length + "#{$CHARACTER_DEFENSE.to_s.light_cyan}"
		puts "\tAGILITY  |" + " " * agility_space_display_length + "#{$CHARACTER_AGILITY.to_s.light_magenta}"
		puts "\tMONEY 	 |" + " " *	(money_space_display_length - 2) + "$ #{$CHARACTER_MONEY.to_s}".light_yellow
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