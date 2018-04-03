require 'json'

class Config

	def initialize
		@rescue_read = 0
	end

	def open?
		config[:open]
	end

	def close?
		config[:close]
	end

	def stop?
		config[:stop]
	end

	private

	def config
		data = JSON.restore File.read 'config.json'

		data.each do |key, value|
			case value
				when 'yes' then data[key.to_sym] = true
				when 'no'  then data[key.to_sym] = false
				else raise ''
			end
		end

		@rescue_read = 0

		data
	rescue
		@rescue_read += 1

		if @rescue_read > 10
			raise 'Bad config'
		end

		sleep 1
		config
	end

end