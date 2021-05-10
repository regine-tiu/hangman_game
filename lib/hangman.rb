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

  def try_guess(char)
    matches = self.get_matching_indices(char)

    if self.already_attempted?(char) == true 
      puts "that has already been attempted"
      return false
    end  

    @attempted_chars << char
    self.fill_indices(char, matches)
    
    @remaining_incorrect_guesses -= 1 if matches.empty?
    
    true
  end  

  def ask_user_for_guess
    puts "Enter a character:"
    user_guess = gets.chomp
    return self.try_guess(user_guess)
  end  

  def win?
   if @guess_word.join("") == @secret_word
      puts "WIN"
      true
   else
      false
   end 
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end    
  
  def game_over?
    if self.win? || self.lose? 
      puts @secret_word
      true
    else
      false
    end

  end  
end


