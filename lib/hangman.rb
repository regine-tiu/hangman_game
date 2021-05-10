class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza", "biscuit", "pokkonius"] 

  def self.random_word
    DICTIONARY.sample
  end  

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end  

  def guess_word
    @guess_word
  end  

  def attempted_chars
    @attempted_chars
  end  

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end  

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end    
  end 
  
  def get_matching_indices(char)
    idx_arr = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        idx_arr << i
      end  
    end 
    idx_arr 
  end  

  def fill_indices(char, idxes)
    idxes.each do |i|
      @guess_word[i] = char
    end
  end 
end


