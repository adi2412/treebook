module ApplicationHelper #add helper classes here

	def flash_class(type) #this class helps differentiate between alerts and errors in the application.html.erb
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-success"
		else
			""
		end
	end
end
