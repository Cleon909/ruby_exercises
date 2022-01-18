# ruby script for mastermind, based on 12 turns and 6 numbers

# class Player
  # attr_reader :name
  #   def initialize
  #     puts "enter player name"
  #         @name = gets.chomp
  #   end
  # end
  
# class Board
  def display_board
    p $guess
    p $feedback.shuffle
  end
# end





# class Code
#   #functions for getting and validating the code either form a player or the computer
# attr_reader :code, :guess, :feedback
  # def initialize (codemaker = "computer")
  #   $code = []
  #   if codemaker == "human"
  #     human_codemaker()
  #   else
  #     computer_codemaker()
  #   end
  # end
  
  def human_codemaker
    valid_input = false
    until valid_input == true
    puts "make the code, enter four numbers between 1-6 seperated by a comma"
    $code = gets.chomp
    $code = code.split(",")
    $code.map! { |num| num.to_i}
      if $code.all? { |num| num.between?(1,6)}
        valid_input = true
      end
    end
  end 

  def computer_codemaker()
    $code[0] = rand(1..6)
    $code[1] = rand(1..6)
    $code[2] = rand(1..6)
    $code[3] = rand(1..6)
  end

  def human_guess
    #code for inputting and validating guess
    valid_input = false
    until valid_input == true
    puts "Enter four numbers between 1-6 seperated by a comma"
    $guess = gets.chomp
    $guess = $guess.split(",")
    $guess.map! { |num| num.to_i}
      if $guess.all? { |num| num.between?(1,6)}
        valid_input = true
      end
    end
  end

  def code_check
    #code for checking the guess against the code and giving feedback
    $feedback = Array.new
    i = 0
    $guess_check = $guess.dup
    4.times do
      if $guess_check[i] == $code[i]
        $feedback[i] = "RED"
        $guess_check[i] = 0
      end
      i += 1
    end
    i = 0
    4.times do
      if $guess_check[i] != 0
        if $guess_check[i] == $code[1..4] 
          $feedback[i] = "WHITE"
        else
          $feedback[i] = "BLANK"
        end
      end
      i += 1
    end 
  end
# end


# # class Game
#   def initialize
#     new_game()
#   end
  
  def new_game()
    # player = Player.new
    # $code = Code.new
    $code = []
    computer_codemaker()
    puts "player name"
    player = gets.chomp
    turns = 0
    12.times do
      p $code
      human_guess()
      code_check()
      display_board()
      turns += 1
      if $guess == $code
        puts " #{player} you've got the code!"
        puts "It took #{turns} turns."
        break
      end
    end
  end


# end

new_game()
