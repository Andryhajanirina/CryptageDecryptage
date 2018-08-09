class CryptageCesar
	
	attr_accessor :texte, :nb_decalage, :alphamin, :alphamaj

	def initialize(texte, nb_decalage)
		@texte = texte
		@nb_decalage = nb_decalage
	  	@alphamin  = Array('a'..'z')
	  	@alphamaj = Array('A'..'Z')
	end
	
	# Formule pour le chiffrement de CESAR. On note Cx(k) le chiffrement de x caractère avec le décalage de k nombre
	# Cx(k) = (x + k) % 26
	# avec [ x = le caractère qui est toujour 0 ], [ k c'est la clé ] et [ 26 c'est le nombre de l'alphabet ]

	def cesar_encrypt
		non_caps  = Hash[@alphamin.zip(@alphamin.rotate(@nb_decalage))]	  
		caps     = Hash[@alphamaj.zip(@alphamaj.rotate(@nb_decalage))]

		encrypter = non_caps.merge(caps)

		result = []

		@texte.chars.map do |c|
			result << encrypter.fetch(c, c)  	
		end
		return result.join
	end

	# En connaissant le formule pour le chiffrement, on obtient la clé de déchiffrement
	# On note Dx(k) le chiffrement de x caractère avec le décalage de k nombre
	# Formule pour le déchiffrement de CESAR
	# Dx(k) = (x - k) % 26
	# avec [ x = le caractère qui est toujour 0 ], [ k c'est la clé ] et [ 26 c'est le nombre de l'alphabet 
	def cesar_decrypt
		non_caps  = Hash[@alphamin.zip(@alphamin.rotate( -@nb_decalage % 26 ))]	  
		caps     = Hash[@alphamaj.zip(@alphamaj.rotate( -@nb_decalage % 26 ))]

		decrypter = non_caps.merge(caps)

		result = []

		@texte.chars.map do |c|
			result << decrypter.fetch(c, c)  	
		end
		return result.join
	end
end

# nv_mot = CryptageCesar.new("zhsba slzf yh Hukyf h", 7)
# # puts "Voici le mot crypté de andry => #{nv_mot.cesar_encrypt}"
# puts "Voici le mot décrypté de andry => #{nv_mot.cesar_decrypt}"