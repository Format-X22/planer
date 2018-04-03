require 'moving_average'

class Candle

	RED = 168
	GREEN = 24

	attr_reader :date,
		:open, :high, :low, :close,
		:prev, :next,
		:ma_red, :ma_green

	attr_writer :next

	def initialize(date, ohlc, prev)
		@date  = date
		@open, @high, @low, @close = ohlc
		@prev = prev
		@next = nil

		calc_ma
	end

	private

	def calc_ma
		data_red = [close]
		data_green = [close]
		prev_tick_red = prev
		prev_tick_green = prev

		loop do
			break unless prev_tick_red
			break if data_red.size == RED

			data_red << prev_tick_red.close

			prev_tick_red = prev_tick_red.prev
		end

		loop do
			break unless prev_tick_green
			break if data_green.size == GREEN

			data_green << prev_tick_green.close

			prev_tick_green = prev_tick_green.prev
		end

		if data_red.size < RED
			@ma_red = nil
			@ma_green = nil
		else
			index_red = data_red.size - 1
			index_green = data_green.size - 1

			@ma_red = data_red.sma(index_red, RED)
			@ma_green = data_green.sma(index_green, GREEN)
		end
	end
end