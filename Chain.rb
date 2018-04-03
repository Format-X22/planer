class Chain
	attr_reader :tail

	def initialize(connector)
		@connector = connector
		@tail = nil
	end

	def sync(&block)
		# TODO SYNC
	end

end