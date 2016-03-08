module InventoryHelper
	def check_inventory
		unless $CHARACTER_INVENTORY.any?
			new_line
			puts "\tThere are no items in your inventory = (".red
			new_line
			return
		end
	end

	def inventory_list_and_prompt
		while true
			new_line
			striped_line
			puts "\t<<< " + "Inventory".light_yellow + " >>>"
			$CHARACTER_INVENTORY.each.with_index { |item, index| puts "\t<#{index.next}> " + "#{item.name}".light_cyan }
			puts "\t<#{$CHARACTER_INVENTORY.count + 1}> Go back..."
			striped_line
			new_line

			# Select Inventory Item
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
	end
end