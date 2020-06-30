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

  # My_all?
  def my_all?
    return enum_for unless block_given?

    my_select { |item| return false unless yield(item) }
    true
  end

#My_any
  def my_any?
    return enum_for unless block_given?
    my_select { |item| return true if yield(item) }
    false
  end

#My_none
def my_none?
  return enum_for unless block_given?
  my_select { |item| return true if yield(item) }
  false
end


end

ha = { 'help' => 'smth', 'learn' => 'wede' }

# arr = %w[ruby dawq]
# p ha.my_none? { |k,v| v == "smth" }

p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
p %w{ant bear cat}.my_none?(/d/)                        #=> true
p [1, 3.14, 42].my_none?(Float)                         #=> false
p [].my_none?                                           #=> true
p [nil].my_none?                                        #=> true
p [nil, false].my_none?                                 #=> true
p [nil, false, true].my_none?                           #=> false
