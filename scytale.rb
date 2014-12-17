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

puts "Welcome to Scytale, a transposition cipher."

loop do
	puts "What do you want to do?"
	puts "(1) - Encrypt a message"
	puts "(2) - Decrypt a message"
	puts "(Other) - Exit"
	choice = gets.chomp.to_i

	if choice == 1
		print "Enter your message: "
		message = gets.chomp.to_s
		print "Enter your cipher: "
		cipher = gets.chomp.to_i

		#run the message and cipher through the encryption class
		outcome = Encrypt.new(message, cipher)

		if cipher >= message.length
			puts "WARNING: The cipher is greater than or equal the size of the message. The message will not encrypt. Do you want to continue?"
			puts "(y) - Yes"
			puts "(n or other) - No"
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts "--------------------------------------------------------------"
				puts "Message: #{message}"
				puts "Cipher: #{cipher}"
				puts "\n"
				puts outcome.makeNewMessage
				puts "\n"
				puts "--------------------------------------------------------------"
			else
				next
			end
		else
			#Display
			puts "--------------------------------------------------------------"
			puts "Message: #{message}"
			puts "Cipher: #{cipher}"
			puts "\n"
			puts outcome.makeNewMessage
			puts "\n"
			puts "--------------------------------------------------------------"
		end
	elsif choice == 2
		print "Enter your message: "
		message = gets.chomp.to_s
		print "Enter your cipher: "
		cipher = gets.chomp.to_i

		#run the message and cipher through the decryption class and display
		outcome = Decrypt.new(message, cipher)

		if cipher >= message.length
			puts "WARNING: The cipher is greater than or equal the size of the message. The message will not encrypt. Do you want to continue?"
			puts "(y) - Yes"
			puts "(n or other) - No"
			responseToWarning = gets.chomp.to_s.downcase

			if responseToWarning[0] == "y"
				#Display outcome
				puts "--------------------------------------------------------------"
				puts "Message: #{message}"
				puts "Cipher: #{cipher}"
				puts "\n"
				puts outcome.makeNewMessage
				puts "\n"
				puts "--------------------------------------------------------------"
			else
				next
			end
		else
			#Display outcome
			puts "--------------------------------------------------------------"
			puts "Message: #{message}"
			puts "Cipher: #{cipher}"
			puts "\n"
			puts outcome.makeNewMessage
			puts "\n"
			puts "--------------------------------------------------------------"
		end
	else
		puts "Goodbye"
        break
	end
end