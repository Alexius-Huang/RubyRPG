class Character
	attr_reader :name, :hp, :mp, :exp, :attack, :defense, :agility, :critical_attack, :luck, :money
	attr_writer :name, :hp, :mp, :exp, :attack, :defense, :agility, :critical_attack, :luck, :money
	def initialize(name = "", hp = 1, mp = 1, exp = 0, attack = 1, defense = 1, agility = 1, critical_attack = 1, luck = 1, money = 0)
		@name = name
		@hp = hp
		@mp = mp
		@exp = exp
		@attack = attack
		@defense = defense
		@agility = agility
		@critical_attack = critical_attack
		@luck = luck
		@money = money
	end
end