# $word = "wanker"
# $worddisplay = "w---k--"
# $guess = ""
# $strikes = 5
# $guessed_letters = ["w", "k", "q", "g", "p"]
# $game_over = 0

# save_file = File.open("hangman_save.txt", "w") { |file|  file.puts [$word, $worddisplay, $strikes, $guessed_letters.join]} 

load_file = File.read("hangman_save.txt")

load_file = load_file.split("\n")


$word = load_file[0]
$worddisplay = load_file[1]
$strikes = load_file[2]
$guessed_letters = load_file[3].split("")

p load_file
puts $word
puts $worddisplay
puts $strikes
p $guessed_letters
