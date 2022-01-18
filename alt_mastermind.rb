# ruby script for mastermind, based on 12 turns and 6 numbers
class Game

  def initialize
    cipher = Code.new
    puts "To be the codemaker enter 1 \nTo be the codebreaker enter 2"
    codemaker = gets.chomp
    if codemaker == '1'
      human_codemaker
    else
      computer_codemaker
    end
    new_game
  end

  def new_game()
    if codemaker == '1'
    turns = 0
      12.times do
        human_guess()
        code_check()
        display_board()
        turns += 1
        if guess.digits == code.digits
          puts "you've got the code!"
          puts "It took #{turns} turns."
          break
        end
      end
    end
    if codemaker == '2'
      # some code for the computer guessing the cipher
    end
  end

  def human_guess
    until guess.digits.validate == true
      guess = Code.new
      puts 'Enter four numbers between 1-6 seperated by a comma'
      @digits = gets.chomp
      @digits.split('')
      guess.validate
    end
  end

  def human_codemaker
    valid = 0
      until valid == 1
        puts 'make the code, enter four numbers between 1-6 seperated by a comma'
        @digits = gets.chomp
        @digits.split('')
        cipher.digits.validate
      end
  end

  def computer_codemaker
    cipher.digits.to_a
    cipher.digits[0] = rand(1..6)
    cipher.digits[1] = rand(1..6)
    cipher.digits[2] = rand(1..6)
    cipher.digits[3] = rand(1..6)
  end
end

class Code

  attr_reader :digits

  def initialize (digits = '')
    @digits = digits
  end

  def validate
    check = @digits.to_a
    check.map! { |num| num.to_i}
      if check.all? { |num| num.between?(1,6)}
        valid = 1
      end
  end

  def code_check
    # code for checking the guess against the code and giving feedback
    @feedback = Array.new
    i = 0
    @guess_check = guess.code
    4.times do
      if guess_check[i] == cipher.code[i]
        @feedback[i] = 'RED'
        @guess_check[i] = 0
      end
      i += 1
    end
    i = 0
    4.times do
      if @guess_check[i] != 0
        if @guess_check[i] == $code[1..4] 
          @feedback[i] = 'WHITE'
        else
          @feedback[i] = 'BLANK'
        end
      end
      i += 1
    end
  end

  def display
    p guess.code.to_i
    p @feedback.shuffle
  end
end

Game.new()