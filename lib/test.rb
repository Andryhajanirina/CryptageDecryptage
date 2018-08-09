puts texte = "Ravololomalala"
puts longeur_chaine = texte.length
tab_char = texte.chars

# puts texte.crypt(/[a-zA-Z0-9\.]{2}/)
cr = texte.crypt(texte)
puts "Texte crypté : #{texte.crypt(texte)}"
puts "Texte décrypté : #{texte.crypt(cr)}"
# puts texte.derypt("salut")