def intro(n)
    yield(n)
    yield('shloch')
    yield(n)
end

intro('bella') do |x|
    puts "hello #{x}"
end


class Person
    @@total = 0
    def initialize(name, age)
        @name = name
        @age = age
        @@total += 1
    end

    def sayNameAndAge
        puts "Hello my name is #{@name} and my age is #{@age}"
    end

    def looping
        while (true) do
          puts "true"
        end
        for number in 1..10 do
          print "#{number}. ' '"
        end
    end
end