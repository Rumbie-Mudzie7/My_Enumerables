require_relative 'enumerables.rb'

# # Sum some numbers
# p (5..10).reduce(:+) #=> 45
# # Same using a block and inject
# p(2..3).my_inject(2) { |sum, n| sum + n } #=> 45
# # Multiply some numbers
# p (1..3).my_inject(1, :-) #=> 151200
# # Same using a block
# p [2,4,1].my_inject(3) { |product, n| product * n } #=> 151200

ar = [2,4,1]
p multiply_els(ar)
# p inject(1){|acc,x| acc*x}

# # find the longest word
# longest = ["cat", "septe", "mber", "faedae"].inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# p longest #=> "sheep"

# arr = [1,3,4,5,6]
# p arr.my_map(&:even?).my_select{|e| e == true}#.my_count
# # p %w(a b c).to_enum(:my_each_with_index).my_map{|a,i| "#{a}, #{i}"}
