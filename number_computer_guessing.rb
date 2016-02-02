rand_num = (1..100).to_a.sample

puts "The random number is #{rand_num}"

puts "Enter a number from 1 to 100 and the computer has five guesses to match it" #

# validates that a number is in the valid integer range
def is_valid_input(input)
   return (input.to_i.to_s == input) && ((1..100).to_a.count(input.to_i) > 0)
end

# gathers user input and validates it
def gather_computer_guess (ary)
  return ary.sample
end

# did the user follow the hint
def in_the_right_direction? (ary, hint)
  if (hint == -1) && (ary.last > ary[-2])# the guess was supposed to have been lower than previoua guess
    puts "Dude! You wasted your guess -- I said LOWER than #{ary[-2]}, as in less, few, etc."
  elsif (hint == 1) && (ary.last < ary[-2]) # the guess was supposed to have been higher guess
    puts "Dude! You wasted your guess -- I said HIGHER than #{ary[-2]}, as in more, greater, etc."
  end
end

bucket = (1..100).to_a
computer_guesses = []  #
computer_guess = 0
count = 0  #track number of guesses
guess_max = 5   #max number of guess
high_low = 0    #use -1 for lower, 0 for equal, 1 for higher

loop do
    if count == 5
      break
    end
    computer_guess = gather_computer_guess(bucket)
    puts "computer guessed #{computer_guess}"
    #this is a valid guess
    computer_guesses << computer_guess
    in_the_right_direction?(computer_guesses, high_low)
    if computer_guess == rand_num
      break
    elsif  computer_guess < rand_num
      puts "Pick a higher number: \n "
      bucket = bucket[computer_guess..bucket.max]
      puts bucket
      high_low = 1
      count += 1
    elsif computer_guess > rand_num
      puts "Pick a lower number: \n"
      bucket = bucket[bucket.first..computer_guess-1]
      puts bucket
      high_low = -1
      count += 1
    end
end

if computer_guess == rand_num
  puts "You're a genius!! #{rand_num} is correct!"
else
  puts "LOSER!! Maybe you would've guessed #{rand_num} with 100 guesses!"
end
