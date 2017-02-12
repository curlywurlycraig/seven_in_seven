# compute the max using inject
def my_max(items)
  items.inject(0) do |curr_max, item|
    if curr_max > item
      curr_max
    else
      item
    end
  end
end

my_max([1, 5, 100, 90])
