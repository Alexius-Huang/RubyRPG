require_relative 'potion'
require_relative 'armor'
require_relative 'accessory'
require_relative 'weapon'

module Manufacturer
	def manufacture_potion(potion)
		Potion.new(name = potion[0], value = potion[1], content = potion[2], options = potion[3])
	end
end