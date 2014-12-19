#Michael Campos
#main.rb

require_relative 'warning.rb'
require_relative 'display.rb'
require_relative 'scytale_algorithms.rb'

puts "Welcome to Scytale, a transposition cipher.\n\n"
message = ""
loop do
	puts "Current Message: #{message}\n"
	puts "What do you want to do?"
	puts "(1) - Encrypt new message"
	puts "(2) - Decrypt new message"
	puts "(3) - Encrypt current message"
	puts "(4) - Decrypt current message"
	puts "(5) - Clear current message"
	puts "(Other) - Exit"
	choice = gets.chomp.to_i

	if choice == 1
		print "Enter your message: "
		message = gets.chomp.to_s
		print "Enter your cipher: "
		cipher = gets.chomp.to_i

		#Run the message and cipher through the encryption class
		outcome = Encrypt.new(message, cipher)

		#If the cipher is bigger than the message then the message cannot be encrypted. This sequence gives users a warning if their cipher is too big and then the option to cancel their request
		if cipher >= message.length
			puts Warning.new.show
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts Display.new(message, cipher, outcome.makeNewMessage).show
			else
				next
			end
		else
			#Display outcome
			puts Display.new(message, cipher, outcome.makeNewMessage).show
		end

		message = outcome.makeNewMessage
	elsif choice == 2
		print "Enter your message: "
		message = gets.chomp.to_s
		print "Enter your cipher: "
		cipher = gets.chomp.to_i

		#Run the message and cipher through the decryption class and display
		outcome = Decrypt.new(message, cipher)

		#If the cipher is bigger than the message then the message cannot be decrypted. This sequence gives users a warning if their cipher is too big and then the option to cancel their request
		if cipher >= message.length
			puts Warning.new.show
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts Display.new(message, cipher, outcome.makeNewMessage).show
			else
				next
			end
		else
			#Display outcome
			puts Display.new(message, cipher, outcome.makeNewMessage).show
		end

		message = outcome.makeNewMessage
	elsif choice == 3
		print "Enter your cipher: "
		cipher = gets.chomp.to_i
		
		#Run the message and cipher through the encryption class
		outcome = Encrypt.new(message, cipher)

		#If the cipher is bigger than the message then the message cannot be encrypted. This sequence gives users a warning if their cipher is too big and then the option to cancel their request
		if cipher >= message.length
			puts Warning.new.show
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts Display.new(message, cipher, outcome.makeNewMessage).show
			else
				next
			end
		else
			#Display outcome
			puts Display.new(message, cipher, outcome.makeNewMessage).show
		end

		message = outcome.makeNewMessage
	elsif choice == 4
		print "Enter your cipher: "
		cipher = gets.chomp.to_i

		#Run the message and cipher through the decryption class and display
		outcome = Decrypt.new(message, cipher)

		#If the cipher is bigger than the message then the message cannot be decrypted. This sequence gives users a warning if their cipher is too big and then the option to cancel their request
		if cipher >= message.length
			puts Warning.new.show
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts Display.new(message, cipher, outcome.makeNewMessage).show
			else
				next
			end
		else
			#Display outcome
			puts Display.new(message, cipher, outcome.makeNewMessage).show
		end

		message = outcome.makeNewMessage
	elsif choice == 5
		message = ""
	else
		puts "Goodbye"
		break
	end
end