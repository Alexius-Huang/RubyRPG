class Character
	attr_reader :name, :hp, :mp, :exp, :attack, :defense
	attr_writer :name, :hp, :mp, :exp, :attack, :defense
	def initialize(name, hp, mp, exp, attack, defense)
		@name = name
		@hp = hp
		@mp = mp
		@exp = exp
		@attack = attack
		@defense = defense
	end
end