def caesar_cipher(string, number)
  alpha = ("a".."z").to_a
  alpha = alpha.reduce({}) do |hsh, i|
    hsh[i] = alpha.index(i)
    hsh
  end 

  array = string.split("")

  array.map do |l|
    i = alpha[l.downcase]
    i = i.nil? ? nil : (i + number) % 26

    new_letter = l == l.downcase ? alpha.key(i) : alpha.key(i).upcase
    new_letter.nil? ? l : new_letter
  end.join
end


p caesar_cipher("What a string!", 5)
p caesar_cipher("What ", 515)