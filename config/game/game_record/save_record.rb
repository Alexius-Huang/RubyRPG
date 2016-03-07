module SaveRecord
	def save_record
		path_name = $RECORD_FOLDER_PATH + "/#{$RECORD_FILE_NAME}"

		if File.exist? path_name 
			file = File.open(path_name, "w") 
		else 
			file = File.new(path_name, "w")
		end
		
		#--------- REMEMBER TO APPEND ATTRIBUTE -----------#

		file.puts "            <<< GAME RECORD FILE >>>"
		file.puts "-" * 50
		file.puts "RECORD FILE NAME       : #{$RECORD_FILE_NAME}"
		file.puts "RECORD ID              : #{$RECORD_ID}"
		file.puts "CHARACTER NAME         : #{$CHARACTER.name}"
		file.puts "CHARACTER LEVEL        : #{$CHARACTER_LEVEL}"
		file.puts "CHARACTER CURRENT HP   : #{$CHARACTER.hp}"
		file.puts "CHARACTER CURRENT MP   : #{$CHARACTER.mp}"
		file.puts "CHARACTER CURRENT EXP  : #{$CHARACTER.exp}"
		file.puts "CHARACTER MAX HP       : #{$CHARACTER_MAX_HP}"
		file.puts "CHARACTER MAX MP       : #{$CHARACTER_MAX_MP}"
		file.puts "CHARACTER MAX EXP      : #{$CHARACTER_MAX_EXP}"
		file.puts "CHARACTER ATTACK       : #{$CHARACTER_ATTACK}"
		file.puts "CHARACTER DEFENSE      : #{$CHARACTER_DEFENSE}"
		file.puts "CHARACTER AGILITY      : #{$CHARACTER_AGILITY}"
		file.puts "CHARACTER MONEY        : #{$CHARACTER_MONEY}"
		file.puts "-" * 50
		
		#-------------------------------------------------#

		file.close
	end
end