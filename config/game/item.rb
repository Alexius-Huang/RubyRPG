class Item
	attr_reader :name, :value, :content, :options
	attr_writer :name, :value, :content, :options

	def initialize(name = nil, value = nil, content = nil, options = {})
		@name = name
		@value = value
		@content = content
		@options = options
	end

end