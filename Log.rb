require 'colorize'

class Log

	def long(value)
		log "Long at #{value.round(0)}", :green
	end

	def short(value)
		log "Short at #{value.round(0)}", :red
	end

	def close_long(value)
		log "Close long at #{value.round(0)}", :green
	end

	def close_short(value)
		log "Close short at #{value.round(0)}", :red
	end

	def safe_error(prefix, msg)
		log "#{prefix} >> #{msg}", :cyan, false
	end

	def major_error(prefix, msg)
		log "#{prefix} >> #{msg}", :cyan
	end

	private

	def log(msg, color, major = true)
		msg = "#{time} - #{msg}"

		puts msg.send(color)

		File.write('log.txt', "#{msg}\n", mode: 'a')

		if major
			# TODO SMS
		end
	end

	def time
		Time.now.strftime('%Y-%m-%d %H:%M')
	end

end