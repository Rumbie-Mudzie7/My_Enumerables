require_relative 'enumerables.rb'

module Enumerable
    def ding?(arg = nil)
      if arg.class == Regexp
        my_select{|el| return false if !arg.match(el)}
      else
    
      end

        if !block_given?
          my_select { |item| return false unless item }
        else
          my_select { |item| return false unless yield(item) }
        end
        true
    end
end

# p %w[ant bear cat].ding? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].ding? { |word| word.length >= 4 } #=> false
p [[121],[3],4].ding?(/d/)                 #=> true
# p [nil, true, 99].ding?                              #=> false
# p [].ding?                                           #=> true

# p /ack/.match('haystack') #=> #<MatchData "y">