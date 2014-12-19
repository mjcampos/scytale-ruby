#Michael Campos
#scytale.rb

module FillEmptySpace
	def fillEmptySpace
		remainder = @message.length % @cipher

		while remainder != 0
			@message << " "
			remainder = @message.length % @cipher
		end

		return @message
	end
end

class Encrypt
	include FillEmptySpace

	def initialize (message, cipher)
		@message = message
		@cipher = cipher
	end

	def makeNewMessage
		plain = fillEmptySpace.chars.to_a
		numberOfRows = plain.length/@cipher
		encoded = []
		encodedString = ""

		#Insert scrambled message into array
		for i in 0...numberOfRows
			for j in 0...@cipher
				encoded.push(plain[i + j * numberOfRows])
			end
		end
		encoded = encoded.compact

		#Remove excess spacing at the end of the array
		while encoded[-1] == " "
			encoded.pop
		end

		#Insert encoded array into string
		encoded.each do |char|
			encodedString << char
		end

		return encodedString
	end
end

class Decrypt
	include FillEmptySpace

	def initialize (message, cipher)
		@message = message
		@cipher = cipher
	end

	def makeNewMessage
		plain = fillEmptySpace.chars.to_a
		numberOfRows = plain.length/@cipher
		decoded = []
		decodedString = ""

		#Insert scrambled message into array
		for i in 0...@cipher
			for j in 0...numberOfRows
				decoded.push(plain[i + j * @cipher])
			end
		end
		decoded = decoded.compact

		#Remove excess spacing at the end of the array
		while decoded[-1] == " "
			decoded.pop
		end

		#Insert decoded array into string
		decoded.each do |char|
			decodedString << char
		end

		return decodedString
	end
end

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

class Warning
	def show
		puts "WARNING: The cipher is greater than or equal the size of the message. The message will not encrypt. Do you want to continue?\n(y) - Yes\n(n or other) - No"
	end
end

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