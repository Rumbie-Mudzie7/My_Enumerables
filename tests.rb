require_relative 'enumerables.rb'

#
# p (5..10).my_reduce(:+) #=> 45

# p (5..10).my_reduce { |sum, n| sum - n } #=> 45

# p (5..10).my_reduce(1, :*) #=> 151200
# (5..10).my_reduce(1) { |product, n| product * n } #=> 151200

# longest = %w[cat sheep bear].my_reduce do |memo, word|
#   memo.length > word.length ? memo : word
# end
# p longest #=> "sheep"

# arr = [2,3,4]
# p multiply_els(arr)


class Foo
    def method_name
      puts "method called for #{object_id}"
    end
  end
  
  [Foo.new, Foo.new].my_map(&:method_name)