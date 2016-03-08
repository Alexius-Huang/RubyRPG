class Monster
	attr_reader :name, :hp, :mp, :exp, :attack, :defense, :agility, :critical_attack, :luck, :money
	attr_writer :name, :hp, :mp, :exp, :attack, :defense, :agility, :critical_attack, :luck, :money
	def initialize(name, hp, mp, exp, attack, defense, agility, critical_attack, luck, money)
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

# Monster Data Base

$MONSTER_DATABASE = [
	$CUTE_PIG = ["Cute Pig", 10, 0, 5, 8, 2, 2, 120, 2.0, 5],
	$CUTE_COW = ["Cute Cow", 15, 0, 8, 10, 4, 3, 120, 3.0, 8]
	#, $TEST_OBJECT = ["TEST"], ?, ?, ?, ?, ?, ?, ?, ?, ?]
]