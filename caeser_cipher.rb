#code to create method for converting string via caser cipher with definable shift

def caeser_cipher (string, shift = 0)
  #creates hash where a = 1, b = 2 etc
  conv_table = {}
  (('a'..'z').zip (1..26)).each {|x| conv_table[x[0]] = x[1] }
  #creates an array of the alphabet for conversion back
  letter_array = ("a".."z").to_a

  #turns string into array but keeps casing
  case_array = string.split ""

  #turns string into array
  string_array = string.downcase.split ""
  #turns string_array into numbers
  num_array = []
  string_array.map { |letter| if letter =~ /[a-z]/ 
      num_array << conv_table[letter]
    else
      num_array << letter   
    end
    }

  #shifts number_array by argument 
  num_array.map! {|num| if num.is_a?(Integer)
    num + shift
  else
    num
  end}


  # creates an output_array of letters shifted by argument
  output_array = []
  num_array.map {|num| 
    if num.is_a?(Integer) != true 
      output_array << num
      elsif
      num <= 26 
       output_array << letter_array[num - 1]
    else 
       output_array << letter_array[num - 27]
    end
  }

  # checks if any characters in letter_array where upcase and creates a reference array with 1 = upcase and 0 = downcase
  uppercase_array = []

  case_array.map {|letter| 
   if letter == letter.upcase 
        uppercase_array << 1
    else
        uppercase_array << 0
   end}

   # creates a new array which is filled by checking each element in output_array and checking the same index number with uppercase_array, if uppercase_array is 1 it upcases the letter before pushing it into upper_case_output_array, if it;s 0 it pushes it though as is.
  uppercase_output_array = []

  output_array.each_with_index {|item, index| 
    if uppercase_array[index] == 1
      uppercase_output_array << output_array[index].upcase
    else
      uppercase_output_array << output_array[index]
    end }
  
#joins the array into a string and puts it. Also checks the shifting is not larger than 26 either end of the alphabet
  caeser_string = uppercase_output_array.join
  if shift > 26 || shift < -26
    puts "shifting too large!"
  else
  puts caeser_string
  end
end

caeser_cipher("What a string!", 5)
