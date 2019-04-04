=begin
    
rescue => exception
    practicing RUBY ENUMERABLES by building my own methods
=end

module Enumerable

    #  1- Create #my_each, a method that is identical to #each but (obviously) does 
    #     not use #each. You’ll need to remember the yield statement. Make sure it
    #     returns the same thing as #each as well.
    def my_each
      for i in 0...self.size
        yield(self[i])
      end
      p self
      return self
    end

    #  2- Create #my_each_with_index in the same way.
    def my_each_with_index 
    end

    #  3-Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
    def my_select
      sel_array = []
      self.my_each {|elm| sel_array << elm if yield(elm)}
      
      sel_array
    end

    # 4 - Create #my_all?
    def my_all?
    end 

    # 5 - Create #my_any?
    def my_any?
    end 

    # 6 - Create #my_none?
    def my_my_noneany?
    end

    # 7 - Create #my_count
    def my_count
    end

    # 8 - Create #my_map
    def my_map
    end

    # 9 - Create #my_inject
    def my_inject
    end

    # 10 - Test your #my_inject by creating a method called #multiply_els which multiplies all the elements of 
    #      the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40
    def my_inject
    end

    # 11 - Modify your #my_map method to take a proc instead.
    def my_map
    end

    # 12 - Modify your #my_map method to take either a proc or a block. It won’t be necessary to apply both a proc and
    #      a block in the same #my_map call since you could get the same effect by chaining together one #my_map 
    #      call with the block and one with the proc. This approach is also clearer, since the user doesn’t have to 
    #      remember whether the proc or block will be run first. So if both a proc and a block are given, only execute the proc.
    def my_map
    end

  end