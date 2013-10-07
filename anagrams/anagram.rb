# Author: Manuel Neuhauser
# Date :  10/7/2013
# Email:  manuel.neuhauser@flatironschool.com

class Anagram

  attr_reader :word_match_string

  def initialize(word)
    @word = word
    @word_match_string = generate_match_string(word)
  end

  def match(words)
    words.select do |potential_anagram|
      word_match_string == generate_match_string(potential_anagram)
    end
  end

  private 

  def generate_match_string(word)
    word.downcase.split("").sort
  end

end