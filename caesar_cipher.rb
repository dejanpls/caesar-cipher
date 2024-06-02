def caesar_cipher(string, number)
    lower_case_alpha = ('a'..'z').zip(0..25).to_h
    upper_case_alpha = ('A'..'Z').zip(0..25).to_h
    encrypted = string.split("").map do |letter|
        if lower_case_alpha.include?(letter)
            sub_letter = get_sub_letter(lower_case_alpha, letter, number)
            letter.replace(sub_letter)
        elsif upper_case_alpha.include?(letter)
            sub_letter = get_sub_letter(upper_case_alpha, letter, number)
            letter.replace(sub_letter)
        else
            letter
        end
    end
    puts encrypted.join
end

def get_sub_letter(array, letter, number)
    sub_idx = array[letter] + number
    sub_idx -= 26 if sub_idx > 25 # a way to wrap from "z" to "a"
    array.key(sub_idx)    
end   

caesar_cipher("What a string!", 5)