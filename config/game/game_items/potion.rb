require_relative '../item'

class Potion < Item

	def initialize(name = nil, value = nil, content = nil, options = {})
		super
	end

	def use
		($CHARACTER.hp + @options[:heal_HP] > $CHARACTER_MAX_HP ? $CHARACTER.hp = $CHARACTER_MAX_HP : $CHARACTER.hp += @options[:heal_HP] ) if @options.include? :heal_HP
		($CHARACTER.hp + @options[:heal_MP] > $CHARACTER_MAX_MP ? $CHARACTER.mp = $CHARACTER_MAX_MP : $CHARACTER.mp += @options[:heal_MP] ) if @options.include? :heal_MP
	end
end

# Potion Data Base

$POTION_DATABASE = [
	[ "Small Health Potion", 15,
		"Small health potion which can heal small amount of character's health.",
		{ heal_HP: 50 }],
	[ "Small Mana Potion", 20,
		"Small mana potion which can recover small amount of character's mana.",
		{ heal_MP: 30 }]
]