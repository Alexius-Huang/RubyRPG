def new_line
	puts "\n"
end

def striped_line
	puts "\t" + "-" * 50
end

def dynamic_load(text, time)
	text.length.times do |num|
		print text[num]
		sleep time
	end
end

# NEW METHOD! #
def push_item(item)
	$CHARACTER_INVENTORY << item
end

[:potion].each do |method_name|
	define_method method_name do |index|
		case method_name
			when :potion then $POTION_DATABASE[index]
		end
	end
end

def option_list(num, *option)
	while true
		puts "\tPlease Enter The Option :"
		(1..num).each { |n| puts "\t<#{n}> #{option[n - 1]}" }
		print "\t>>> "
		$SELECT_TOKEN = gets.to_i
		if $SELECT_TOKEN > num || $SELECT_TOKEN < 1 
			puts "\tWrong Input! You Should Only Input 1 ~ #{num} !".red
			new_line
		else
			new_line
			break
		end
	end
end

def random_token_generator(range)
	r = Random.new
	$RANDOM_TOKEN = r.rand(range)
end

def delay
	sleep 0.5
	print '.'
	sleep 0.5
	print '.'
	sleep 0.5
	puts '.'
end

def console
	new_line
	puts "\t@monster_name      = #{@monster_name     }"
	puts "\t@monster_hp        = #{@monster_hp       }" 
	puts "\t@monster_max_hp    = #{@monster_max_hp   }"
	puts "\t@monster_mp        = #{@monster_mp       }"
	puts "\t@monster_max_mp    = #{@monster_max_mp   }"
	puts "\t@monster_exp       = #{@monster_exp      }"
	puts "\t@monster_attack    = #{@monster_attack   }"
	puts "\t@monster_defense   = #{@monster_defense  }"
	puts "\t@monster_agility   = #{@monster_agility  }"
	puts "\t$CHARACTER_NAME    = #{$CHARACTER_NAME   }"
	puts "\t$CHARACTER_LEVEL   = #{$CHARACTER_LEVEL  }"
	puts "\t$CHARACTER_MAX_HP  = #{$CHARACTER_MAX_HP }"
	puts "\t$CHARACTER_MAX_MP  = #{$CHARACTER_MAX_MP }"
	puts "\t$CHARACTER_MAX_EXP = #{$CHARACTER_MAX_EXP}"
	puts "\t$CHARACTER_ATTACK  = #{$CHARACTER_ATTACK }"
	puts "\t$CHARACTER_DEFENSE = #{$CHARACTER_DEFENSE}"
	puts "\t$CHARACTER_AGILITY = #{$CHARACTER_AGILITY}"
	puts "\t$CHARACTER.hp      = #{$CHARACTER.hp     }"
	puts "\t$CHARACTER.mp 		 = #{$CHARACTER.mp     }"
	puts "\t$CHARACTER.attack  = #{$CHARACTER.attack }"
	puts "\t$CHARACTER.defense = #{$CHARACTER.defense}"
	puts "\t$CHARACTER.agility = #{$CHARACTER.agility}"
	new_line
end	