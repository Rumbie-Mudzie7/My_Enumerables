module Enumerable
  def my_each
    return enum_for unless block_given?

    for item in self 
      yield(item)
    end
  end
end


