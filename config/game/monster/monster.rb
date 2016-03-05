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
	Monster.new("Cute Pig", 5, 0, 4, 4, 0, 2),
	Monster.new("Cute Cow", 7, 0, 5, 6, 1, 3)
#	$TEST_BOSS = Monster.new("Test Boss", 100,100,100,100,100)
]

$MONSTERS = [
	$CUTE_PIG = [5,0],
	$CUTE_COW = [7,0]
]