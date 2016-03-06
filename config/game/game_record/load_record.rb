module LoadRecord
	def load_record
		list_player_names
		#list all file name => can select or go back
		view_file_info
		#View the file info => can enter or back to previous list
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
	end
end