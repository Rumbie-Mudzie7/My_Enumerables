require_relative 'enumerables.rb'

# My each fails
# TEST CASES MY_EACH_WITH_INDEX
# hash = Hash.new
# %w(cat dog wombat).my_each_with_index { |item, index|
#   hash[item] = index
# }
# p hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

# ar = []
# block = Proc.new{|el,i| ar<< [el+1,i]}
#  array.my_each_with_index(&block)

#   array.each_with_index(&block)
#  p ar
# ar = []

#  block = proc { |num|  ar<<(num < 4) }

# # p array.my_each_with_index(&block)

#  => nil
# p array.each_with_index(&block)

# My all

# TEST CASES MY_ALL
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true

# p array.my_all?(3)

# #  => true
# p array.all?(3)
# #  => false

##### my_any

# TEST CASES MY_EACH
# ary = [1,2,3,4,5]
# ary.my_each do |i|
#    puts i
# end

# TEST CASES MY_SELECT
# p (1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]

# p [1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]

# p [:foo, :bar].my_select { |x| x == :foo }   #=> [:foo]

# # TEST CASES MY_ALL
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true

# TEST CASES MY_ANY
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[anty bears caaat].any? { |word| word.length > 4 } #=> true
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p [nil, true,1].my_any?(Integer)                     #=> true
# p [nil, false, 99].my_any? #=> true
# p [].my_any? #=> false

# words = %w[dog bat rod blade]

#  p words.my_any?('cat')

# #  => true

#  p words.any?('cat')

#  => false

# false_array = [nil, false, nil]

# #  => [nil, false, nil, false,]

# p false_array.any?

# # # #  => false

# # p false_array.my_any?
# words = ["dog", "door", "rod"]

# p words.my_any?(Integer)

# # # #     #  => false

# p  words.any?(Integer)

# #     #  true

#   p words.my_any?('sun')

#     # => true

#   p words.any?('sun')

# p a

# TEST CASES MY_NONE

# p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.my_none?(/d/)                        #=> true
# p [1, 3, 42].my_none?(String)                         #=> false
# p [].my_none?                                           #=> true
# p [nil].my_none?                                        #=> true
# p [nil, false].my_none?                                 #=> true
# p [nil,3 , true].my_none?                           #=> false

# words = ["dog", "door", "rod", "dwad"]

# p words.my_none?("pop")

# # # # #  => false

#  p words.none?("pop")

#  => true

# TEST CASES MY_COUNT

# ary = [1, 2, 4, 2]
# p ary.my_count #=> 4
# p ary.my_count(2) #=> 2
# p ary.my_count(&:even?) #=> 3

# TEST CASES MY_MAP

# p (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
# p (1..4).my_map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]

# TEST CASES MY_REDUCE

# # Sum some numbers
# p (5..10).my_reduce(:+)                             #=> 45
# # Same using a block and inject
# p (5..10).my_reduce { |sum, n| sum + n }            #=> 45
# # Multiply some numbers
# p (5..10).my_reduce(1, :*)                          #=> 151200
# # Same using a block
# p (5..10).my_reduce(1) { |product, n| product * n } #=> 151200
# # find the longest word
# longest = %w{ cat sheep bear }.my_reduce do |memo, word|
#    memo.length > word.length ? memo : word
# end
# p longest                                        #=> "sheep"

# p multiply_els(ary)

# my_proc = proc

# p array.my_map { |num| num > 10 } # { |num| num < 10 }

# # p array.map(my_proc)# { |num| num < 10 }

# p array.my_map{|num| num < 10 } == array.map(&my_proc)

# p array.my_map(&my_proc) == array.map(&my_proc)

# #  => false

# burgers = { 'Big Mac' => 300, 'Whopper with cheese' => 450, "Wendy's Double with cheese" => 320 }

# p burgers.my_map
