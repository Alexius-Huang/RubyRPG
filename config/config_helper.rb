def new_line
	puts "\n"
end

def striped_line
	puts "\t" + "-" * 50
end

def option_list(num, *option)
	while true
		puts "\tPlease Enter The Option :"
		(1..num).each do |n|
			puts "\t<#{n}> #{option[n - 1]}"
		end
		print "\t>>> "
		$SELECT_TOKEN = gets.to_i
		if $SELECT_TOKEN > num || $SELECT_TOKEN < 1 
			puts "\tWrong Input! You Should Only Input 1 ~ #{num} !"
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