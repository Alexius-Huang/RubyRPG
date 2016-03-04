class Monster
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

# Monster Data Base
$MONSTER_DATABASE = [
	$Cute_PIG = Monster.new("Cute Pig", 5, 0, 2, 2, 0),
	$Cute_COW = Monster.new("Cute Cow", 7, 0, 3, 3, 1)
]