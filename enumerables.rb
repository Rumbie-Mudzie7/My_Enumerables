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
      return ar.empty? ? false : true
    end

    !block_given? ? my_select { |item| return false if item } : my_select { |item| return false if yield(item) }
    true
  end

  # MY_COUNT
  # def my_count(_args = nil)
  #   count
  # end
end
