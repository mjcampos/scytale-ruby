#Michael Campos
#warning.rb

class Warning
	def show
		puts "WARNING: The cipher is greater than or equal the size of the message. The message will not encrypt. Do you want to continue?\n(y) - Yes\n(n or other) - No"
	end
end