#!/usr/bin/env ruby -wKU

DICT = "/usr/share/dict/words"

def generate_word_list
  words = Array.new

  File.open(DICT, "r") do |file|
    file.each do |word|
      word.chomp!
      # discard words that are too long or short for scrabble's rules
      next if word.length > 7 or word.length < 2
      word.downcase!
      words.push(word)
    end
  end
  return words
end

def validate_input(input)
  # Check for nil/empty or non a-z input
  if input.nil? or input.empty?
    return false
  end

  regex = /^[a-zA-Z]+/
  input =~ regex
end

def can_form_word(tile_letters, word)
  # Determine whether a word can be formed using the letters passed in
  word.each_char.all? { |character| word.count(character) <= tile_letters.count(character) }
end

def scrabble(input)
  if not validate_input(input)
    p "Please pass in a valid string of tiles. A-Z ASCII characters only."
    return
  end

  tile_letters = input.downcase
  word_list = generate_word_list
  usable_words = Array.new

  word_list.each do |word|
    # Only check to see if a word can be formed if tile_letters 
    # contains the first character of the dictionary word
    if tile_letters.include? word[0]
      # Generate an array of all words that can be formed by the letters passed in 
      if can_form_word(tile_letters, word)
        usable_words.push(word)
      end      
    end
  end

  if usable_words.all?(&:nil?)
    p "A word can't be formed with the letters '#{input}'. Sorry!"
    return
  end

  # Print the longest word that contains only the given tiles
  p usable_words.max_by(&:length)

end

# Call the main method
scrabble(ARGV[0].dup)
