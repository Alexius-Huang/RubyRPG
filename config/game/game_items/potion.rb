require_relative '../item'

class Potion < Item
	attr_reader :id, :item_type
	attr_writer :id

	def initialize(name = nil, value = nil, content = nil, options = {}, id = nil, item_type = "potion")
		super(name, value, content, options)
		@id = id
		@item_type = item_type
	end

	def use
		($CHARACTER.hp + @options[:heal_HP] > $CHARACTER_MAX_HP ? $CHARACTER.hp = $CHARACTER_MAX_HP : $CHARACTER.hp += @options[:heal_HP] ) if @options.include? :heal_HP
		($CHARACTER.hp + @options[:heal_MP] > $CHARACTER_MAX_MP ? $CHARACTER.mp = $CHARACTER_MAX_MP : $CHARACTER.mp += @options[:heal_MP] ) if @options.include? :heal_MP
		
		yield
	end
end

# Potion Data Base

$POTION_DATABASE = [
	Potion.new(name = "Small Health Potion", value = 15, content = "Small health potion which can heal small amount of character's health. It can heal 50 HP points.", options = { heal_HP: 50 }, id = 1 ),
	Potion.new(name = "Small Mana Potion", value = 20, content = "Small mana potion which can recover small amount of character's mana. It can recover 30 MP points.", options = { heal_MP: 30 }, id = 2 )
]