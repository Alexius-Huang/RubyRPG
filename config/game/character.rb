class Character
	attr_reader :name, :hp, :mp, :exp, :attack, :defense, :agility
	attr_writer :name, :hp, :mp, :exp, :attack, :defense, :agility
	def initialize(name = "", hp = 1, mp = 1, exp = 0, attack = 1, defense = 1, agility = 1)
		@name = name
		@hp = hp
		@mp = mp
		@exp = exp
		@attack = attack
		@defense = defense
		@agility = agility
	end
end