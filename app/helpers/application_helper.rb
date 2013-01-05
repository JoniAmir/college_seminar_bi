module ApplicationHelper

	def show_log
	  change_log(STDOUT)
	end

	def hide_log
	  change_log(nil)
	end

	def change_log(stream, colorize=true)
	  ActiveRecord::Base.logger = ::Logger.new(stream)
	  ActiveRecord::Base.clear_all_connections!
	  #ActiveRecord::Base.colorize_logging = colorize
	end

end
