require_relative 'inventory_helper'
require_relative './monster/battle_helper'

module Inventory
	include InventoryHelper
	def view_inventory
		system 'clear'

		check_inventory
		inventory_list_and_prompt #Will Return the $SELECT_TOKEN

		return if $SELECT_TOKEN == $CHARACTER_INVENTORY.count.next
		
		@item = $CHARACTER_INVENTORY[$SELECT_TOKEN - 1]
		
		view_specific_item(@item)

		option_list(2,
			"Use #{@item.name}",
			"Go back..."
		)
		case $SELECT_TOKEN
			when 1
				@item.use do  # 'use' function with yield block 
					print "\tUsing" + " #{@item.name}".light_cyan
					delay
					@item.options.each do |key, value|
						puts "\tYou".light_yellow + " have recovered " + case key
							when :heal_HP then "#{value} HP points".light_red + " !"
							when :heal_MP then "#{value} MP points".blue + " !"
						end
					end
					monster_attack if $BATTLE_START_TOKEN
				end
				
			when 2 then return
		end

	end

	def view_specific_item(item)
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