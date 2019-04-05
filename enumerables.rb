module Enumerable  
  def my_each
    type = self.class
    if type == Array || type == Range
      for item in self
        yield item
      end
    elsif type == Hash
      keys = self.keys
      for key in keys
        value = self[key]
        yield(key)
        yield(value)
      end
    end
    return self
  end
  

  def my_each_with_index 
    type = self.class
    if type == Array || type == Range
      for i in 0...self.size
        yield(self[i], i)
      end
    
    return self
  end

  def my_select
    arr = []
    self.my_each do |item|
      arr << item if yield(item)
    end
    return arr
  end

  def my_all?
    self.my_each do |item|
      return false unless yield(item)
    end
    return true
  end 


  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    return false
  end 

  def my_none?
    self.my_any? do |item|
      return false if yield(item)
    end
    return true
  end

  def my_count(arg=nil)
    if !(arg.nil?)
      total = 0
      self.my_each do |item|
        total += 1 if item == arg
      end
      return total
    elsif block_given?
      total= 0
      mappings = self.my_map {|item| yield(item)}
      mappings.my_each do |item|
        total += 1 if item == true
      end
      return total
    else
      total = 0
      self.my_each { |item| total += 1 }
      return total
    end
  end

  def my_map
    arr = []
    self.my_each {|item| arr << (proc.nil? ? yield(item) : proc.call(item))}
    return arr
  end

  def my_inject(init=nil, sym=nil)
    if init && sym
      self.my_each do |item|
        init = item.method(sym).call(init)
      end
    elsif init && sym.nil? && !block_given?
      sym = init
      init = self.first
      self[1..-1].my_each do |item|
        init = item.method(sym).call(init)
      end
    elsif block_given?
      arr = []
      if init.nil?
        init = self.first
        arr = self[1..-1]
      else
        arr = self
      end
      arr.my_each do |item|
        init = yield(init,item)
      end
    else
      raise ArgumentError, "Incorrect arguments provided" 
    end
  return init
  end
end



def multiply_els(array)
  return array.my_inject(:+)
end
