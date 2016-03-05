require_relative 'config_helper'
require_relative 'game/explore'
require_relative 'game/character'
require 'colorize'

module NewGame
	def new_game
		story
		# Setup character's parameters
		puts "\tEnter your character's name ~"
		print "\t>>> "

		$CHARACTER = Character.new(gets.chomp, 20, 5, 0, 5, 2, 3)
		$CHARACTER_MAX_HP = 20
		$CHARACTER_MAX_MP = 5
		$CHARACTER_MAX_EXP = 10
		$CHARACTER_ATTACK = 5
		$CHARACTER_DEFENSE = 2
		$CHARACTER_AGILITY = 3
		$PROCESS_GAME_TOKEN = true
		new_line
	end

	def story
		striped_line
		puts "\t Once upon a time ..."
		striped_line
		new_line
	end
end

module ProcessGame
	def process
		loop do
			striped_line
			show_current_state
			striped_line
			option_list( 4,
				"Explore",
				"Look At Inventory",
				"Save Record",
				"Exit Game"
			)
			case $SELECT_TOKEN
				when 1
					include Explore
					random_token_generator(1..100)
					explore
				when 2, 3, 4
					puts "\tBye Bye ~!"
					$PROCESS_GAME_TOKEN = false
					$QUIT_GAME_TOKEN = true
			end
		end
	end

	def show_current_state
		puts "\t<<< #{$CHARACTER.name.light_yellow} >>>"

		hp_display_length = $CHARACTER.hp.to_s.length + 1 + $CHARACTER_MAX_HP.to_s.length
		mp_display_length = $CHARACTER.mp.to_s.length + 1 + $CHARACTER_MAX_MP.to_s.length
		attack_display_length = $CHARACTER_ATTACK.to_s.length
		defense_display_length = $CHARACTER_DEFENSE.to_s.length
		agility_display_length = $CHARACTER_AGILITY.to_s.length
		exp_display_length = $CHARACTER.exp.to_s.length + 1 + $CHARACTER_MAX_EXP.to_s.length

		hp_space_display_length = 40 - hp_display_length
		mp_space_display_length = 40 - mp_display_length
		attack_space_display_length = 40 - attack_display_length
		defense_space_display_length = 40 - defense_display_length
		agility_space_display_length = 40 - agility_display_length
		exp_space_display_length = 40 - exp_display_length

		bar_length = 48
		hp_bar  = ( Rational($CHARACTER.hp,  $CHARACTER_MAX_HP ) * bar_length ).to_i
		mp_bar  = ( Rational($CHARACTER.mp,  $CHARACTER_MAX_MP ) * bar_length ).to_i
		exp_bar = ( Rational($CHARACTER.exp, $CHARACTER_MAX_EXP) * bar_length ).to_i
		hp_bar_space  = bar_length - hp_bar
		mp_bar_space  = bar_length - mp_bar
		exp_bar_space = bar_length - exp_bar

		puts "\tHP       |" + " " * hp_space_display_length + "#{$CHARACTER_MAX_HP}/#{$CHARACTER.hp.to_s.light_red}"
		puts "\t[" + "|".light_red * hp_bar + " " * hp_bar_space + "]"
		
		puts "\tMP       |" + " " * mp_space_display_length + "#{$CHARACTER_MAX_MP}/#{$CHARACTER.mp.to_s.blue}"
		puts "\t[" + "|".blue * mp_bar + " " * mp_bar_space + "]"
		
		puts "\tEXP      |" + " " * exp_space_display_length + "#{$CHARACTER_MAX_EXP}/#{$CHARACTER.exp.to_s.light_green}"
		puts "\t[" + "|".light_green * exp_bar + " " * exp_bar_space + "]" 

		puts "\tATTACK   |" + " " * attack_space_display_length + "#{$CHARACTER_ATTACK.to_s.red}"
		puts "\tDEFENSE  |" + " " * defense_space_display_length + "#{$CHARACTER_DEFENSE.to_s.light_cyan}"
		puts "\tAGILITY  |" + " " * agility_space_display_length + "#{$CHARACTER_AGILITY.to_s.light_magenta}"
	end

end
