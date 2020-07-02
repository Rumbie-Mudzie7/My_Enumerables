 require_relative 'enumerables.rb'


#
p (5..10).my_reduce(:+)                             #=> 45

p (5..10).my_reduce { |sum, n| sum + n }            #=> 45

p (5..10).my_reduce(1, :*)                          #=> 151200
(5..10).my_reduce(1) { |product, n| product * n } #=> 151200

longest = %w{ cat sheep bear }.my_reduce do |memo, word|
   memo.length > word.length ? memo : word
end
p  longest                                        #=> "sheep"

code = Proc.new{|el| accumul = yield(accumul, el) }
