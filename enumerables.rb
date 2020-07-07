module Enumerable
  def my_each
    return enum_for unless block_given?

    array = is_a?(Array) ? self : to_a
    i = 0
    while i < array.length
      yield(array[i])
      i += 1
    end
    self
  end

  def my_each_with_index(&arg)
    array = is_a?(Array) ? self : to_a
    if arg
      i = 0
      while i < array.length
        arg.call(array[i], i)
        i += 1
      end
    end
    return enum_for(:my_each) unless block_given?

    unless arg
      i = 0
      while i < array.length
        yield(array[i], i)
        i += 1
      end
    end
    self
  end

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

  def my_all?(args = nil)
    my_select { |el| return false unless el.match?(args) } if args.class == Regexp
    my_select { |el| return false unless el.is_a?(args) } if args.class == Class
    if args.class == Integer || args.class == String || args.class == Float
      my_select { |el| return false unless el == args }
    end
    !block_given? ? my_select { |item| return false unless item } : my_select { |item| return false unless yield(item) }
    true
  end

  def my_any?(args = nil)
    return !my_select { |el| args == el }.empty? if args.is_a? String
    return !my_select { |el| el.is_a?(args) }.empty? if args.is_a? Class
    return !my_select { |el| el.match?(args) }.empty? if args.is_a? Regexp
    return !my_select { |item| item }.empty? unless block_given?

    my_select { |item| return true if yield(item) }
    false
  end

  def my_none?(args = nil)
    return !my_any? { |el| el.match?(args) } if args.is_a? Regexp
    return my_select { |el| el == args }.empty? if args.is_a? String
    return my_select { |el| el == args }.empty? if args.is_a?(Integer)
    return my_select { |el| el == args }.empty? if args.is_a?(Float)

    !block_given? ? my_select { |item| return false if item } : my_select { |item| return false if yield(item) }
    true
  end

  def my_count(args = nil)
    return size if !block_given? && args.nil?
    return my_select { |el| el == args }.size unless args.nil?
    return my_select { |el| yield(el) }.size if block_given?
  end

  def my_map(*args)
    return enum_for(:my_map) if !block_given? && args[0].nil?

    ar = []
    my_each { |item| ar << (args[0].nil? ? yield(item) : args[0].call(item)) }
    ar
  end

  def my_inject(arg1 = nil, arg2 = nil)
    accumul = to_a[0]
    rest = to_a[1..-1]
    code = proc { |el| accumul = yield(accumul, el) }

    if block_given?
      unless arg1
        rest.my_each(&code)
        return accumul
      end
      accumul = arg1
      to_a.my_each(&code)
      return accumul
    end

    if arg1 && arg2
      accumul = arg1
      my_each { |el| accumul = accumul.send(arg2, el) }
      return accumul
    end
    rest.my_each { |el| accumul = accumul.send(arg1, el) } if arg1.is_a?(Symbol)
    accumul
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end
