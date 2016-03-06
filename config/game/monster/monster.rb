class Monster
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

# Monster Data Base

$MONSTER_DATABASE = [
	$CUTE_PIG = ["Cute Pig", 5, 0, 4, 4, 0, 2],
	$CUTE_COW = ["Cute Cow", 7, 0, 5, 6, 1, 3]
]