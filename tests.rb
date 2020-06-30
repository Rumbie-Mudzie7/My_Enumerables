require_relative 'enumerables.rb'
# (1..5).my_each do |item|
#     puts item
#  end
ar = []
has = { 'hello' => 'buy', 'true' => 'false' }
has.my_each { |_k, v| ar << v }

# has.each  {|k,v| ar<< v}
p ar
