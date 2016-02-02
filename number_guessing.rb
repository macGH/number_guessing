#This program gives the user a chance to guess a number between 1 - 100
pool_of_numbers = (1..100).to_a

rand_num = pool_of_numbers.sample

puts "Shhh, rand_num is #{rand_num.to_s}\n\n" #debug

user_guesses = []  #initialize user_guess number
user_guess = 0
user_count = 0  #track number of guesses
guess_max = 5   #max number of guess
high_low = 0    #use -1 for lower, 0 for equal, 1 for higher

# This method validates that a number is in the valid integer range
def is_valid_input(input)
   return (input.to_i.to_s == input) && ((1..100).to_a.count(input.to_i) > 0)
end

# This method gathers user input and validates it
def gather_user_input
  puts "Enter your guess from a number 1 through 100: "
  user_input = gets.chomp
  if is_valid_input (user_input)
    return user_input.to_i
  else
    return 0      # return zero as marker for invalid input
  end
end

def in_the_right_direction? (ary, hint)
  if (hint == -1) && (ary.last > ary[-2])# the guess was supposed to have been lower than previoua guess
    puts "Dude! You wasted your guess -- I said LOWER than #{ary[-2]}, as in less, few, etc."
  elsif (hint == 1) && (ary.last < ary[-2]) # the guess was supposed to have been higher guess
    puts "Dude! You wasted your guess -- I said HIGHER than #{ary[-2]}, as in more, greater, etc."
  end
end

until user_guess == rand_num || user_count == 5  #until correct guess or the max is hit
  user_guess = gather_user_input
  if user_guess == 0      #input was not valid
    puts "Basic math -- You haven't entered an integer between 1 and 100. Try again. \n\n"

  elsif (user_guesses.count > 0) && (user_guesses.count(user_guess) > 0)  # was this guess already provided?
    puts "Short term memory issues? You've already guessed #{user_guess}.  Try again. \n\n"

  elsif   #this is a valid guess
    user_guesses << user_guess
    in_the_right_direction?(user_guesses, high_low)
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

if user_guess == rand_num
  puts "You're a genius!! #{rand_num} is correct!"
else
  puts "LOSER!! Maybe you would've guessed #{rand_num} with 100 guesses!"
end
