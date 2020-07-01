require_relative 'enumerables.rb'

ary = [1, 6, 4, 3, 5 , 7]
p ary.my_count #=> 6
p ary.my_count(7) #=> 1
p ary.my_count { |x| x % 3 != 0 } #=> 4
