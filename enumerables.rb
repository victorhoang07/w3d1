class Array

    def my_each(&prc)

        i = 0

        while i < self.length
            prc.call(self[i])

            i += 1
        end
        self
    end


    def my_select(&prc)
        arr = []

        self.my_each do |ele|
            arr << ele if prc.call(ele)
        end
        return arr 

    end

    def my_any?(&prc)

        self.my_each do |ele|
           return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
           return false if !prc.call(ele)
        end
        return true
    end

    def my_flatten
        arr = []
        
        self.my_each do |ele|
            if ele.is_a?(Array)
                arr += ele.my_flatten
            else
                arr << ele
            end
        end
        return arr
    end

    def my_zip(*arr)
        
        zip = []

        self.length.times do |i|
            subarr = [self[i]]

            arr.my_each do |arg|
                subarr << arg[i]
            end
            zip << subarr
        end

        zip
    end

    def my_rotate(num = 1)
        
        num.times do 
        a = self.shift
        self << a
        end
        self
    end

    def my_join(split = "")
        fin_str = ""
        i = 0
        while i <= self.length - 1
            if i == self.length - 1
                fin_str += self[i]
            else
            fin_str += self[i] + split
            end
            i += 1
        end
        fin_str
    end

    def my_reverse
        arr = []

        self.my_each do |ele|
            arr.unshift(ele) 
        end
        arr
        
    end
end

# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end
# # => 1
#     # 2
#     # 3
#     # 1
#     # 2
#     # 3

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]