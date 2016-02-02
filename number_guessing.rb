rand_num = rand(100)
puts "Shhh, rand_num is #{rand_num.to_s}" #debug

user_guesses = []  #initialize user_guess number
user_guess = 0
user_count = 0  #track number of guesses
guess_max = 5   #max number of guess
is_invalid = true
high_low = 0    #use -1 for lower, 0 for equal, 1 for higher


def is_integer (input)
   return input.to_i.to_s == input
end

def gather_user_input
  puts "Enter your guess from a number 1 through 100: "
  user_input = gets.chomp
  if is_integer (user_input)
    return user_input.to_i
  else
    return 0
  end
end

until user_guess == rand_num || user_count == 5
  user_guess = gather_user_input
  if user_guess == 0
    puts "Basic math -- You haven't entered an integer between 1 and 100. Try again."
  elsif
    user_guesses << user_guess
    if user_guess < rand_num
      puts "Pick a higher number: \n "
      high_low = 1
      user_count += 1
    elsif user_guess > rand_num
      puts "Pick a lower number: \n"
      high_low = -1
      user_count += 1
    end
  end
end
