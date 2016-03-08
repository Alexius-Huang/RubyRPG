module SaveRecord
	def save_record
		path_name = $RECORD_FOLDER_PATH + "/#{$RECORD_FILE_NAME}"
		item_path_name = $RECORD_ITEMS_FOLDER_PATH + "/#{$RECORD_INVENTORY_ITEMS_FILE_NAME}"

		if File.exist? path_name 
			file = File.open(path_name, "w") 
		else 
			file = File.new(path_name, "w")
		end
		
		#--------- REMEMBER TO APPEND ATTRIBUTE -----------#

		dynamic_write file, "            <<< GAME RECORD FILE >>>"
		dynamic_write file, "-" * 50
		dynamic_write file, "RECORD FILE NAME       : #{$RECORD_FILE_NAME}"
		dynamic_write file, "RECORD ID              : #{$RECORD_ID}"
		dynamic_write file, "CHARACTER NAME         : #{$CHARACTER.name}"
		dynamic_write file, "CHARACTER LEVEL        : #{$CHARACTER_LEVEL}"
		dynamic_write file, "CHARACTER CURRENT HP   : #{$CHARACTER.hp}"
		dynamic_write file, "CHARACTER CURRENT MP   : #{$CHARACTER.mp}"
		dynamic_write file, "CHARACTER CURRENT EXP  : #{$CHARACTER.exp}"
		dynamic_write file, "CHARACTER MAX HP       : #{$CHARACTER_MAX_HP}"
		dynamic_write file, "CHARACTER MAX MP       : #{$CHARACTER_MAX_MP}"
		dynamic_write file, "CHARACTER MAX EXP      : #{$CHARACTER_MAX_EXP}"
		dynamic_write file, "CHARACTER ATTACK       : #{$CHARACTER_ATTACK}"
		dynamic_write file, "CHARACTER DEFENSE      : #{$CHARACTER_DEFENSE}"
		dynamic_write file, "CHARACTER AGILITY      : #{$CHARACTER_AGILITY}"
		dynamic_write file, "CHARACTER CRITICAL ATK : #{$CHARACTER_CRITICAL_ATTACK_RATE}"
		dynamic_write file, "CHARACTER LUCK         : #{$CHARACTER_LUCK}"
		dynamic_write file, "CHARACTER MONEY        : #{$CHARACTER_MONEY}"
		dynamic_write file, "-" * 50

		file.close

		#--------------------------------------------------#

		if File.exist? item_path_name 
			file = File.open(item_path_name, "w") 
		else 
			file = File.new(item_path_name, "w")
		end

		#--------- REMEMBER TO APPEND ATTRIBUTE -----------#

		file.puts "           <<< GAME IMPLICIT DATA >>>"
		file.puts "-" * 50
		file.puts "CHARACTER INVENTORY :"
		$CHARACTER_INVENTORY.each.with_index do |item, index|
			file.puts ""
			file.puts "ITEM #{index + 1}"
			file.puts "TYPE    => #{item.item_type}"
			file.puts "ITEM_ID => #{item.id}"
			file.puts ""
		end
		file.puts "-" * 50

		file.close

		#-------------------------------------------------#

		new_line
		print "\tGame record saving"
		delay
		new_line
		striped_line
		dynamic_load("\t[" + "|".blue * 48 + "]", 0.005)
		new_line
		striped_line

		new_line

		striped_line
		new_line
		puts "\tSave Complete!".light_yellow
		new_line
		striped_line

		new_line
	end

	def dynamic_write(file, text)
		file.puts text
		dynamic_load "\t" + text + "\n", 0.005
	end
end