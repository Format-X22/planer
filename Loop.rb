class Loop

	INTERVAL = 10

	def initialize(config, connector)
		@config = config
		@logger = Log.new
		@connector = connector
		@chain = Chain.new @connector

		loop do
			if config.stop?
				break
			end

			@chain.sync do
				iteration
			end

			sleep INTERVAL
		end
	end

	def iteration
		if position? and ma_cross? and can_close?
			if long_position?
				close_long
			else
				close_short
			end
		elsif can_open?
			if long_phase?
				long_order
			else
				short_order
			end
		end
	end

	def can_open?
		@config.open?
	end

	def can_close?
		@config.close?
	end

	def position?
		# TODO
	end

	def long_position?
		# TODO
	end

	def ma_cross?
		tail = @chain.tail
		prev = tail.prev

		(prev.ma_red >= prev.ma_green and tail.ma_red < tail.ma_green) or
		(prev.ma_red <= prev.ma_green and tail.ma_red > tail.ma_green)
	end

	def close_long
		# TODO
	end

	def close_short
		# TODO
	end

	def long_phase?
		@chain.tail.ma_green > @chain.tail.ma_red
	end

	def long_order
		# TODO
	end

	def short_order
		# TODO
	end

end