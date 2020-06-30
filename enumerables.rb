module Enumerable
  def my_each
    return enum_for unless block_given?

    i = 0
    while i < size
      yield(to_a[i])
      i += 1
    end
  end

  # My_each with index
  def my_each_with_index
    return enum_for unless block_given?

    i = 0
    while i < size
      yield(to_a[i], i)
      i += 1
    end
  end
  # My_SELECT

  def my_select
    return enum_for unless block_given?

    if is_a? Hash
      selected = []
      arr = to_a
      arr.my_each { |el| selected << el if yield(el) }
      return selected.to_h
    end
    selected = []
    arr = to_a
    arr.my_each { |el| selected << el if yield(el) }
    selected
  end
end

# ha = { 'help' => 'me', 'learn' => 'smth' }
# arr = [2, 4, 6, 9, 7, 10, 4]
# p arr.my_select { |el| el == 4 }
