# require_relative 'enumerables.rb'

# # p (5..10).my_reduce(:+) #=> 45

# p(2..3).my_reduce(2) { |sum, n| sum + n } #=> 45
# # Multiply some numbers
# p(1..3).my_reduce(4) { |x, y| x + y } #=> 151200
# # Same using a block
# p [2, 4, 1].my_reduce('hello') { |product, n| product * n } #=> 151200

# # # find the longest word
# # longest = ["cat", "septe", "mber", "help"].my_reduce do |memo, word|
# #   memo.length > word.length ? memo : word
# # end
# # p longest #=> "sheep"

# # arr = [1,3,4,5]
# # p arr.my_map(&:even?).my_select{|e| e == true}#.my_count
# # # p %w(a b c).to_enum(:my_each_with_index).my_map{|a,i| "#{a}, #{i}"}

# # p multiply_els(arr)
