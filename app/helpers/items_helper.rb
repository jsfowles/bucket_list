module ItemsHelper

	def display_date(item)
		"#{item.complete_by.strftime("%B")} #{item.complete_by.day}, #{item.complete_by.year}"
	end

	def display_completed(item)
		"#{item.completed_date.strftime("%B")} #{item.completed_date.day}, #{item.completed_date.year}"
	end

	def time_remaining(item)
		(item.complete_by - Date.today).to_i
	end

end
