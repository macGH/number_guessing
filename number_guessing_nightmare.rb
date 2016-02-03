rand_num = (1..100).to_a.sample

puts "The random number is #{rand_num}\n"


# validates that a number is in the valid integer range
def is_valid_input(input)
   return (input.to_i.to_s == input) && ((1..100).to_a.count(input.to_i) > 0)
end

# gathers user input and validates it
def gather_current_guess (ary)
  return ary.sample
end


bucket = (1..100).to_a
current_guess = 0
count = 0  #track number of guesses
guess_max = 5   #max number of guess
high_low = 0    #use -1 for lower, 0 for equal, 1 for higher

loop do
    if count == 5
      break
    end
    current_guess = gather_current_guess(bucket)
    #puts "top loop modified bucket after last guess: #{bucket.to_s}"
    puts "computer guessed #{current_guess}"
    #this is a valid guess
    if current_guess == rand_num
      break
    elsif  current_guess < rand_num
      puts "Pick a higher number than #{current_guess}"
      bucket = bucket[bucket.index(current_guess+1)..bucket.index(bucket.last)]
      high_low = 1
      count += 1
    elsif current_guess > rand_num
      puts "Pick a lower number than #{current_guess}"
      bucket = bucket[bucket.index(bucket.first)..bucket.index(current_guess-1)]
      high_low = -1
      count += 1
    end
end

if current_guess == rand_num
  puts "You're a genius!! #{rand_num} is correct!"
else
  puts "LOSER!! Maybe you would've guessed #{rand_num} with 100 guesses!"
end
