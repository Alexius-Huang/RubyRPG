class Monster
	attr_reader :name, :hp, :mp, :exp, :attack, :defense, :agility, :money
	attr_writer :name, :hp, :mp, :exp, :attack, :defense, :agility, :money
	def initialize(name, hp, mp, exp, attack, defense, agility, money)
		@name = name
		@hp = hp
		@mp = mp
		@exp = exp
		@attack = attack
		@defense = defense
		@agility = agility
		@money = money
	end
end

# Monster Data Base

$MONSTER_DATABASE = [
	$CUTE_PIG = ["Cute Pig", 5, 0, 4, 4, 0, 2, 3],
	$CUTE_COW = ["Cute Cow", 7, 0, 5, 6, 1, 3, 4]
]