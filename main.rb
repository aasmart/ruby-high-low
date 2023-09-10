require_relative "stats"

def num_bounds
  print "Enter the number's minimum value:"
  until (min = (Integer(gets.chomp) rescue false))
    if !min
      print "Invalid input. Make sure the number is a valid integer:"
    else
      break;
    end
  end

  print "Enter the number's maximum value:"
  until (max = (Integer(gets.chomp) rescue false))
    if max > min
      break;
    else
      print "Invalid input; Enter a valid integer greater than #{min}:"
    end
  end

  min..max
end

def game(num)
  guesses = 1

  print "Enter your guess:"
  until (guess = (Integer(gets.chomp) rescue false)) == num
    if !guess
      print "Invalid guess. Enter a valid integer:"
    elsif guess < num
      print "#{guess} is too low. Try again:"
      guesses += 1
    elsif guess > num
      print "#{guess} is too high. Try again:"
      guesses += 1
    end
  end

  print "You correctly guessed the number, #{num}, in #{guesses} guess(es)!\n\n"

  guesses
end

def game_summary(rounds)
  puts "Game Summary"
  puts "-------------------"

  puts "Total Guesses: #{total(rounds)}"
  puts "Maximum Guesses: #{rounds.max}"
  puts "Minimum Guesses: #{rounds.min}"
  puts "Average Guesses: #{mean(rounds)}"
  puts "Median Guesses: #{median(rounds)}"
  puts "Standard Deviation: #{std_dev(rounds).truncate(2)}"

  rounds.each_with_index do |round, i|
    puts "Game ##{i + 1}: #{round} guess(es)"
  end

  print "\n"
end

def yes_no_input?(message)
  while true
    print message
    res = gets.chomp.downcase

    if res.start_with?"n"
      return false
    elsif !res.start_with? "y"
      puts "Invalid response.\n"
      next
    end

    return true
  end
end

def main
  while yes_no_input? "Would you like to play a game of High Low [y/n]?"
    rounds = []

    bounds = num_bounds
    guesses = game(rand(bounds))
    rounds.push(guesses)

    while yes_no_input? "Would you like to play another round [y/n]?"
      guesses = game(rand(bounds))
      rounds.push(guesses)
    end

    if rounds.size > 0
      game_summary rounds
    end
  end

  print "\nThank you for playing!"
end

main