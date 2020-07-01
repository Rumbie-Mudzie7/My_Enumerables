require_relative 'enumerables.rb'

# # Sum some numbers
# p (5..10).reduce(:+) #=> 45
# # Same using a block and inject
p (2..3).inject  { |sum, n| sum + n } #=> 45
# # Multiply some numbers
# p (5..10).reduce(1, :*) #=> 151200
# # Same using a block
# p (1..10).inject(1) { |product, n| product + n } #=> 151200
# # find the longest word
# longest = %w[cat sheep bear].inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# p longest #=> "sheep"

# # arr = [1,3,4,5,6]
# # p arr.my_map(&:even?).my_select{|e| e == true}.my_count
# # p %w(a b c).to_enum(:my_each_with_index).my_map{|a,i| "#{a}, #{i}"}
