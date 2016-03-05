class Character
	attr_reader :name, :hp, :mp, :exp, :attack, :defense, :agility
	attr_writer :name, :hp, :mp, :exp, :attack, :defense, :agility
	def initialize(name, hp, mp, exp, attack, defense, agility)
		@name = name
		@hp = hp
		@mp = mp
		@exp = exp
		@attack = attack
		@defense = defense
		@agility = agility
	end
end