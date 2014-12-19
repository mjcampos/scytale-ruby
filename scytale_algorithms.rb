#Michael Campos
#scytale_algorithms.rb

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