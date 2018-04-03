require 'require_all'
require_all './'

config = Config.new

if config.stop?
	raise '"stop" is true'
end

Loop.new config