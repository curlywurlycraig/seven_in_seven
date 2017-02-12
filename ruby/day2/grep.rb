def grep(filename, search_string)
  File.open(filename) do |file|
    file.readlines.each do |line|
      puts line if /#{search_string}/.match?(line)
    end
  end
end

grep('test_input.txt', 'speckled')
