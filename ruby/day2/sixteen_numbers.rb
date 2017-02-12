def four_at_a_time_without_slice(array)
  line = []
  array.each do |number|
    line.push(number)

    if (number % 4).zero? && !line.empty?
      puts "Four numbers: #{line}"
      line = []
    end
  end
end

def four_at_a_time_with_slice(array)
  array.each_slice(4) do |number_slice|
    puts "Four numbers: #{number_slice}"
  end
end

numbers = (1..16).to_a
four_at_a_time_without_slice(numbers)
four_at_a_time_with_slice(numbers)
