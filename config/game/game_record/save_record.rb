module SaveRecord
	def save_record
		path_name = "./config/game/game_record/player_records/#{$RECORD_FILE_NAME}"

		file = File.open(path_name, "w") if File.exist? path_name else file = File.new(path_name, "w")

		file.puts "          <<< GAME RECORD FILE >>>"
		file.puts "----------------------------------------------"
		file.puts "RECORD FILE NAME       : #{$RECORD_FILE_NAME}"
		file.puts "RECORD ID              : #{$RECORD_ID}"
		file.puts "CHARACTER NAME         : #{$CHARACTER_NAME}"
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
		file.puts "----------------------------------------------"
		
		file.close
	end
end