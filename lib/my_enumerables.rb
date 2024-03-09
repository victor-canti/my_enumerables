module Enumerable
  def my_all?
    boolean = false
    my_each do |value|
      if yield(value)
        boolean = true
      else
        boolean = false
      end
    end
    boolean
  end

  def my_any?
    my_each do |value|
      return true if yield(value)
    end
    false
  end

  def my_count
    count = 0
    if block_given?
      my_each do |value|
        count += 1 if yield(value)
      end
    else
      my_each { |value| count += 1 }
    end
    count
  end

  def my_each_with_index
    index = 0
    my_each do |value|
      yield value, index
      index += 1
    end
  end

  def my_inject(default)
    my_each do |value|
      default = yield(default, value)
    end
    default
  end

  def my_none?
    my_each do |value|
      return false if yield(value)
    end
    true
  end

  def my_map
    map = []
    my_each do |value|
      map << yield(value)
    end
    map
  end

  def my_select
    select = []
    my_each do |value|
      select << value if yield(value)
    end
    select
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for value in self
      yield value
    end
  end
end
