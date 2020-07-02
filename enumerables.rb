module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    array = is_a?(Array) ? self : to_a
    i = 0
    while i < array.length
      yield(array[i])
      i += 1
    end
  end

  # My_each with index
  def my_each_with_index
    return enum_for(:my_each) unless block_given?

    array = is_a?(Array) ? self : to_a
    i = 0
    while i < array.length
      yield(array[i], i)
      i += 1
    end
  end

  # My_SELECT

  def my_select
    return enum_for unless block_given?

    if is_a? Hash
      selected = []
      arr = to_a
      arr.my_each { |el| selected << el if yield(el) }
      return selected.to_h
    end
    selected = []
    arr = to_a
    arr.my_each { |el| selected << el if yield(el) }
    selected
  end

  # My_all?
  def my_all?(args = nil)
    my_select { |el| return false unless el.match?(args) } if args.class == Regexp
    my_select { |el| return false unless el.is_a?(args) } if args.class == Class
    !block_given? ? my_select { |item| return false unless item } : my_select { |item| return false unless yield(item) }
    true
  end

  # My_any
  def my_any?(args = nil)
    if args.class == Regexp
      ar = []
      my_each { |el| ar << el if el.match?(args) }
      return ar.empty? ? false : true
    end

    my_select { |el| return true if el.is_a?(args) } if args.class == Class
    unless block_given?
      my_select { |item| return true if item }
    end
    my_select { |item| return true if yield(item) }
    false
  end

  # My_none

  def my_none?(args = nil)
    if args.class == Regexp
      ar = []
      my_each { |el| ar << el if el.match?(args) }
      return ar.empty? ? true : false
    end
    if args.class == Class
      ar = []
      my_each { |el| ar << el if el.is_a?(args) }
      return ar.empty? ? true : false
    end
    !block_given? ? my_select { |item| return false if item } : my_select { |item| return false if yield(item) }
    true
  end

  # MY_COUNT
  def my_count(args = nil)
    return size if !block_given? && args.nil?

    ar = my_select { |el| el == args }
    return ar.size unless args.nil?

    ar = my_select { |el| yield(el) }
    return ar.size if block_given?
  end

  # MY_MAP
  def my_map
    return enum_for(:my_map) unless block_given?

    ar = []
    my_each { |el| ar << yield(el) }
    ar
  end

  # MY_REDUCE
  # def my_inject(args = nil)
  # if args == nil
  # memo = to_a[0]
  # num = 0
  # end

  # end

  def my_inject(initial = nil, second = nil)
    arr = if is_a?(Array)
            self
          else
            to_a
          end
    sym = initial if initial.is_a?(Symbol) || initial.is_a?(String)
    acc = initial if initial.is_a? Integer
    if initial.is_a?(Integer)
      sym = second if second.is_a?(Symbol) || second.is_a?(String)
    end

    if sym
      arr.my_each { |x| acc = acc ? acc.send(sym, x) : x }
    elsif block_given?
      arr.my_each { |x| acc = acc ? yield(acc, x) : x }
    end
    acc
  end
end

def multiply_els(arr)
  arr.inject(:*)
end
