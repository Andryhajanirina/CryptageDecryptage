# Similaire avec le chiffrement de CESAR mais un peu complexe
# CHIFFFREMENT : Cx1,x2,...xk(n1,n2,...,nk) = (x1 + n1, x2 + n2, ..., xk + nk)
# DECHIFFFREMENT : C-n1,-n2,...,-nk
class CryptageVigenere

	attr_accessor :texte, :nb_decalage

	def initialize(texte, nb_decalage = [])
		@texte = texte
		@nb_decalage = nb_decalage
	end

	def vigenere_encrypt
		i = 0
		@result = []
		@texte.chars.map do |caractere|
			new_c = (caractere.ord) + @nb_decalage[i]
			res = new_c.chr
			@result << res
			i += 1
		end
		return @result.join
	end

	def vigenere_decrypt
		i = 0
		@resultat = []
		vigenere_encrypt.chars.map do |caractere|
			res = caractere.ord - @nb_decalage[i]
			@resultat << res.chr
			i += 1
		end
		return @resultat.join
	end
end

bloc = [1, 2, 3, 4, 5, 6]
nv_mot = CryptageVigenere.new("andryh", bloc)
puts "Voici le mot crypté de andry => #{nv_mot.vigenere_encrypt}"
puts "Voici le mot décrypté de andry => #{nv_mot.vigenere_decrypt}"
# puts .chr