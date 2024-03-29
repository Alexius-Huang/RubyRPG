require_relative "../game_items/potion"

module LoadRecord
	def load_record
		while $LOAD_GAME_TOKEN
			list_player_names
			#list all file name => can select or go back
			return if $SELECT_TOKEN == @record_files.count + 1
			new_line

			view_file_info
			#View the file info => can enter or back to previous list
		end
	end

	def list_player_names
		player_names = []
		@record_files.each do |file|
			file = File.open($RECORD_FOLDER_PATH + "/#{file}", "r")
			text = file.read.to_s
			name = ""
			increment_num = 25
			index_of_char = text.index("CHARACTER NAME") + increment_num 
			while text[index_of_char] != "\n"
				name += text[index_of_char]
				index_of_char += 1
			end
			player_names << name
		end

		while true
			puts "\tEach record player name listed below:"
			(1..@record_files.count).each do |n|
				puts "\t<#{n}> #{player_names[n - 1]}"
			end
			puts "\t<#{@record_files.count + 1}> Go Back..."
			print "\t>>> "
			$SELECT_TOKEN = gets.to_i
			if $SELECT_TOKEN > @record_files.count + 1 || $SELECT_TOKEN < 1 
				puts "\tWrong Input! You Should Only Input 1 ~ #{@record_files.count + 1} !"
				new_line
			else
				new_line
				break
			end
		end
	end

	def view_file_info
		print "\tLoading" 
		delay
		new_line

		$RECORD_FILE_NAME = @record_files[$SELECT_TOKEN - 1]
		$RECORD_INVENTORY_ITEMS_FILE_NAME = @record_item_files[$SELECT_TOKEN - 1]
		
		path_name = $RECORD_FOLDER_PATH + "/#{$RECORD_FILE_NAME}"
		item_path_name = $RECORD_ITEMS_FOLDER_PATH + "/#{$RECORD_INVENTORY_ITEMS_FILE_NAME}"
		
		@text = File.read(path_name).to_s.[] 153..-53
		@item_text = File.read(item_path_name).to_s 

		striped_line
		puts "\t< CHARACTER INFO >"
		@text.each_line { |line| puts "\t" + line }
		striped_line

		option_list(2,
			"Continue the Great Adventure!",
			"Go back..."
		)

		if $SELECT_TOKEN == 1
			load_character_attributes
			$LOAD_GAME_TOKEN = false
		else
			$LOAD_GAME_TOKEN = true
		end
		
		new_line
	end

	def load_character_attributes
		puts "\tWriting data..."
		new_line
		striped_line
		@text.each_line { |line| dynamic_load("\t" + line.chomp + " ...Complete!\n".yellow, 0.005) }
		striped_line

		$CHARACTER = Character.new

		attribute_value = []
		item_value = []

		@text.each_line do |line|
			data = ""
			line.chomp!
			counter = -1
			while line[counter] != " "
				data += line[counter].to_s
				counter -= 1
			end
			attribute_value << data.reverse
		end

		item_id = []
		item_type = []

		@item_text.each_line do |line|	
			counter = 11
			value = ""

###READY FOR DEBIG

			if !line.match(/ITEM_ID/).nil?
				while line[counter] != nil
					value += line[counter]
					counter += 1
				end
				item_id << value.to_i
			elsif !line.match(/TYPE/).nil?
				while line[counter] != nil
					value += line[counter]
					counter += 1
				end
				item_type << value
			end		
		end

		item_value = item_type.zip item_id 

#--------- REMEMBER TO APPEND ATTRIBUTES ---------#

		$CHARACTER.name = attribute_value[0]
		$CHARACTER_LEVEL = attribute_value[1].to_i
		$CHARACTER.hp = attribute_value[2].to_i
		$CHARACTER.mp = attribute_value[3].to_i
		$CHARACTER.exp = attribute_value[4].to_i
		$CHARACTER_MAX_HP = attribute_value[5].to_i
		$CHARACTER_MAX_MP = attribute_value[6].to_i
		$CHARACTER_MAX_EXP = attribute_value[7].to_i
		$CHARACTER.attack = $CHARACTER_ATTACK = attribute_value[8].to_i
		$CHARACTER.defense = $CHARACTER_DEFENSE = attribute_value[9].to_i
		$CHARACTER.agility = $CHARACTER_AGILITY = attribute_value[10].to_i
		$CHARACTER.critical_attack = $CHARACTER_CRITICAL_ATTACK_RATE = attribute_value[11].to_i
		$CHARACTER.luck = $CHARACTER_LUCK = attribute_value[12].to_i
		$CHARACTER.money = $CHARACTER_MONEY = attribute_value[13].to_i

		# INITIALIZE INVENTROY
		$CHARACTER_INVENTORY = []
		
		# APPEND ITEMS TO $CHARACTER_INVENTORY #
		item_value.each { |type, id| push_item $POTION_DATABASE[id - 1] if type.chomp == "potion" }

#-------------------------------------------------#

		new_line
		print "\tReady in 3"
		delay
		print "\tReady in 2"
		delay
		print "\tReady in 1"
		delay
		new_line

		system 'clear'
		new_line

		$PROCESS_GAME_TOKEN = true
	
	end
end