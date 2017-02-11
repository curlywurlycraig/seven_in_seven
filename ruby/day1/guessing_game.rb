puts "I want to play a game. A guessing game."
puts "Keep entering numbers until it's correct!"

answer = rand(100)
guess = gets.to_i
while guess != answer
  if guess > answer
    puts "Too high!"
  else
    puts "Too low!"
  end

  guess = gets.to_i
end

puts "Yay, correct!"
