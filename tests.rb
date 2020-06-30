require_relative 'enumerables.rb'

Lots = Struct.new(:a, :b, :c, :d, :e, :f)
l = Lots.new(11, 22, 33, 44, 55, 66)
p l.my_select(&:even?) #=> [22, 44, 66]
