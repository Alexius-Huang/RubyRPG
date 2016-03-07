module Inventory
	def view_inventory
		unless $CHARACTER_INVENTORY.any?
			new_line
			puts "\tThere are no items in your inventory = (".red
			new_line
			return
		end

		while true
			new_line
			striped_line
			puts "\t<<< " + "Inventory".light_yellow + " >>>"
			$CHARACTER_INVENTORY.each.with_index { |item, index| puts "\t<#{index.next}> " + "#{item.name}".light_cyan }
			puts "\t<#{$CHARACTER_INVENTORY.count + 1}> Go back..."
			striped_line
			new_line

			# Select Item
			puts "\tEnter Option to View The Item :"
			print "\t>>> "
			$SELECT_TOKEN = gets.to_i
			if $SELECT_TOKEN > $CHARACTER_INVENTORY.count.next || $SELECT_TOKEN < 1
				puts "\tWrong Input! You Should Only Input 1 ~ #{$CHARACTER_INVENTORY.count} !".red
				new_line
			else
				new_line
				break
			end
		end

		return if $SELECT_TOKEN == $CHARACTER_INVENTORY.count.next
		
		@item = $CHARACTER_INVENTORY[$SELECT_TOKEN - 1]
		view_item(@item)
		option_list(2,
			"Use #{@item.name}",
			"Go back..."
		)
		case $SELECT_TOKEN
			when 1
				puts "Under Construction..."
			when 2 then return
		end

	end

	def view_item(item)
		new_line
		striped_line
		puts "\t<<< " + item.name.light_cyan + " >>>"
		puts "\tVALUE    | " + "$ #{item.value}".light_yellow
		
		words = item.content.split
		line = check = ""
		print "\tCONTENT  | "


		words.each do |word|
			check += word + " "
			if check.length < 40
				line += word + " "
			else
				puts line
				print "\t         | "
				line = check = word + " "
			end

			puts line if word == words.last
		end
		striped_line
		new_line
	end

end