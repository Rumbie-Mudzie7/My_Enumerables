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
# array = [5, 7, 0, 7, 6, 0, 8, 0, 1, 6, 4, 5, 7, 6, 8, 4, 2, 6, 4, 5, 8, 5, 5, 0, 5, 1, 0, 6, 4, 2, 6, 3, 6, 8, 6, 0, 8, 3, 4, 5, 3, 0, 1, 2, 2, 5, 4, 3, 0, 8, 6, 7, 8, 4, 6, 2, 6, 2, 6, 7, 3, 4, 8, 7, 4, 7, 1, 3, 6, 7, 8, 1, 5, 5, 6, 2, 7, 5, 3, 1, 7, 8, 5, 6, 8, 0, 0, 6, 4, 8, 2, 7, 8, 0, 4, 6, 8, 6, 8, 4] 
#   array.my_each_with_index(&block)

#   array.each_with_index(&block)
#  p ar

#My all
# array = [5, 7, 0, 7, 6, 0, 8, 0, 1, 6, 4, 5, 7, 6, 8, 4, 2, 6, 4, 5, 8, 5, 5, 0, 5, 1, 0, 6, 4, 2, 6, 3, 6, 8, 6, 0, 8, 3, 4, 5, 3, 0, 1, 2, 2, 5, 4, 3, 0, 8, 6, 7, 8, 4, 6, 2, 6, 2, 6, 7, 3, 4, 8, 7, 4, 7, 1, 3, 6, 7, 8, 1, 5, 5, 6, 2, 7, 5, 3, 1, 7, 8, 5, 6, 8, 0, 0, 6, 4, 8, 2, 7, 8, 0, 4, 6, 8, 6, 8, 4] 

#  array.my_all?(3)

# #  => true 
#  array.all?(3)

#  => false 

##### my_any

# 2.6.5 :025 > false_array = [nil, false, nil, false]

#  => [nil, false, nil, false] 

# 2.6.5 :026 > false_array.any?

#  => false 

# 2.6.5 :027 > false_array.my_any?

# Traceback (most recent call last):

#         9: from /usr/share/rvm/rubies/ruby-2.6.5/bin/irb:23:in `<main>'

#         8: from /usr/share/rvm/rubies/ruby-2.6.5/bin/irb:23:in `load'

#         7: from /usr/share/rvm/rubies/ruby-2.6.5/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'

#         6: from (irb):27

#         5: from enumerables.rb:64:in `my_any?'

#         4: from enumerables.rb:40:in `my_select'

#         3: from enumerables.rb:9:in `my_each'

#         2: from enumerables.rb:40:in `block in my_select'

#         1: from enumerables.rb:64:in `block in my_any?'

# LocalJumpError (no block given (yield))
















# TEST CASES MY_EACH
# ary = [1,2,3,4,5]
# ary.my_each do |i|
#    puts i
# end


# TEST CASES MY_SELECT
# p (1..10).my_select { |i|  i % 3 == 0 }   #=> [3, 6, 9]

# p [1,2,3,4,5].my_select { |num|  num.even?  }   #=> [2, 4]

# p [:foo, :bar].my_select { |x| x == :foo }   #=> [:foo]

# TEST CASES MY_ALL
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all?(/t/)                        #=> false
# p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
# p [nil, true, 99].my_all?                              #=> false
# p [].my_all?                                           #=> true

# TEST CASES MY_ANY
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].my_any?                              #=> true
# p [].my_any?                                           #=> false

# TEST CASES MY_NONE

# p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.my_none?(/d/)                        #=> true
# p [1, 3.14, 42].my_none?(Float)                         #=> false
# p [].my_none?                                           #=> true
# p [nil].my_none?                                        #=> true
# p [nil, false].my_none?                                 #=> true
# p [nil, false, true].my_none?                           #=> false

# TEST CASES MY_COUNT

# ary = [1, 2, 4, 2]
# p ary.my_count               #=> 4
# p ary.my_count(2)            #=> 2
# p ary.my_count{ |x| x%2==0 } #=> 3

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
