class CryptageInverse
	attr_accessor :mot_cryptee

	def initialize(mot)
		@mot = mot
	end

	def encrypt
		return @mot.reverse
	end
	
	def decrypt
		return encrypt
	end
end

# nv_mot = CryptageInverse.new("47221251yrdna")
# puts nv_mot.decrypt