module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    array = is_a?(Array) ? self : to_a
    i = 0
    while i < array.length
      yield(array[i])
      i += 1
    end
  end

  # My_each with index
  def my_each_with_index
    return enum_for(:my_each) unless block_given?

    array = is_a?(Array) ? self : to_a
    i = 0
    while i < array.length
      yield(array[i], i)
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

  # My_all?
  def my_all?(_arg = nil)
    if !block_given?
      my_select { |item| return false unless item }
    else
      my_select { |item| return false unless yield(item) }
    end
    true
  end

  # My_any
  def my_any?
    if !block_given?
      my_select { |item| return true if item }
    else
      my_select { |item| return true if yield(item) }
    end
    false
  end

  # My_none

  def my_none?
    if !block_given?
      my_select { |item| return false if item }
    else
      my_select { |item| return false if yield(item) }
    end
    true
  end

  # MY_COUNT
  def my_count(_arg = nil)
    count
  end
end

# ha = { 'help' => 'smth', 'learn' => 'wede' }
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# # p %w[ant bear cat].my_all?(/t/)                        #=> false
# # p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true

# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# # p %w[ant bear cat].my_any?(/d/)                        #=> false
# # p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].my_any?                              #=> true
# p [].my_any?                                           #=> false
