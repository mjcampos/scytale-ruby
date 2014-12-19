#Michael Campos
#display.rb

class Display
	def initialize (message, cipher, outcome)
		@message = message
		@cipher = cipher
		@outcome = outcome
	end

	def show
		puts "--------------------------------------------------------------\nMessage: #{@message}\nCipher: #{@cipher}\n\n#{@outcome}\n\n--------------------------------------------------------------"
	end
end