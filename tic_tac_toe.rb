$board = Hash.new
$board[:TL] = ""
$board[:T] = ""
$board[:TR] = ""
$board[:L] = ""
$board[:M] = ""
$board[:R] = ""
$board[:BL] = ""
$board[:B] = ""
$board[:BR] = ""


def display
    #code to display template $board
      puts " TL | T | TR           #{$board[:TL]} | #{$board[:T]} | #{$board[:TR]}"
      puts "------------           ---------"
      puts " L  | M | R            #{$board[:L]} | #{$board[:M]} | #{$board[:R]}"
      puts "------------           ---------"
      puts " BL | B | BR           #{$board[:BL]} | #{$board[:B]} | #{$board[:BR]}"   
end



class Players
attr_reader :name
  def initialize 
    @name = gets.chomp
  end
end

class Game
  def initialize
    new_game()
  end

  def new_game
    puts "player 1 enter name"
    @player1 = Players.new
    puts "player 2 enter name"
    @player2 = Players.new
    display()

    while game_won? == false
      puts "#{@player1.name} enter square co-ordinates"
      input = gets.chomp
      input = input.upcase.to_sym
        # while input != :TL || input != :T || input != :TR || input != :L || input != :M || input != :R || input != :BR || input != :B || input != :BL
        #   puts "invalid entry, try again"
        #   input = gets.chomp
        #   input = input.upcase.to_sym
        # # end
      until $board[input] == "" 
        puts "square already taken, or incorrect input. Try again"
        input = gets.chomp
        input = input.upcase.to_sym
      end 
        $board[input]  <<  "X"
        display()
      

      if game_won? != false
        puts "#{@player1.name} won!"
        display()
        break
      elsif $board.has_value?("") != true
        puts "DRAW!"
        display()
        break
      end


      puts "#{@player2.name} enter square co-ordinates"
      input = gets.chomp
      input = input.upcase.to_sym
      # while input != :TL || input != :T || input != :TR || input != :L || input != :M || input != :R || input != :BR || input != :B || input != :BL
        # puts "invalid entry, try again"
        # input = gets.chomp
        # input = input.upcase!.to_sym
      # end

      until $board[input] == "" 
        puts "square already taken, or incorrect input.  Try again"
        input = gets.chomp
        input = input.upcase.to_sym
      end 
        $board[input]  <<  "O"
        display()

      if game_won? != false
        puts "#{@player2.name} won!"
        display()
      elsif $board.has_value?("") != true
        puts "DRAW!"
        display()
        break
      end
    end

  end

  def game_won?
    #code to check winning state
    if $board[:TL] == "X" && $board[:T] == "X" && $board[:TR] == "X"
      true
      #code to reset game
    elsif $board[:TL] == "O" && $board[:T] == "O" && $board[:TR] == "O"
    true
      #code to reset game
    elsif $board[:L] == "X" && $board[:M] == "X" && $board[:R] == "X"
      true
      #code to reset game
    elsif $board[:L] == "O" && $board[:M] == "O" && $board[:R] == "O"
      true
      #code to reset game
    elsif $board[:BL] == "X" && $board[:B] == "X" && $board[:BR] == "X"
      true
      #code to reset game
    elsif $board[:BL] == "O" && $board[:B] == "O" && $board[:BR] == "O"
      true
      #code to reset game
    elsif $board[:TL] == "X" && $board[:L] == "X" && $board[:BL] == "X"
      true
      #code to reset game
    elsif $board[:TL] == "O" && $board[:L] == "O" && $board[:BL] == "O"
      true
      #code to reset game
    elsif $board[:T] == "X" && $board[:M] == "X" &&  $board[:B] == "X"
      true
      #code to reset game
    elsif $board[:T] == "O" && $board[:M] == "O" && $board[:B] == "O"
      true
      #code to reset game
    elsif $board[:TR] == "X" && $board[:R] == "X" && $board[:BR] == "X"
      true
      #code to reset game
    elsif $board[:TR] == "O" && $board[:R] == "O" && $board[:BR] == "O"
      true
      #code to reset game
    elsif $board[:TL] == "X" && $board[:M] == "X" && $board[:BR] == "X"
      true
      #code to reset game
    elsif $board[:TL] == "O" && $board[:M] == "O" && $board[:BR] == "O"
      true
      #code to reset game
    elsif $board[:TR] == "X" && $board[:M] == "X" && $board[:BL] == "X"
      true
      #code to reset game
    elsif $board[:TR] == "O" && $board[:M] == "O" && $board[:BL] == "O"
      true
      #code to reset game
    # elsif $board.any? { |val| val != "" }
    #   true
    else
      false
    end
  end
end

Game.new