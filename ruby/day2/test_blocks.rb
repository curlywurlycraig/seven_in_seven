def yield_times(count)
  while count > 0
    yield
    count -= 1
  end
end

yield_times(10) do
  puts 'hello'
end

# can also pass block in as an argument and call it
# but this is not preferred
def do_times(count, &block)
  while count > 0
    block.call
    count -= 1
  end
end

do_times(10) do
  puts 'hello'
end
