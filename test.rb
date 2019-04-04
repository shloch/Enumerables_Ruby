def intro(n)
    yield(n)
    yield('shloch')
    yield(n)
end

intro('bella') do |x|
    puts "hello #{x}"
end
