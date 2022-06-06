class Player
    attr_reader :name
    @@alphabet = "abcedfghijklmnopqrstuvwxyz"
    def initialize(name)
        @name = name
    end

    def guess
        p "Give me a letter"
        
        letter = gets.chomp
        if !@@alphabet.include?(letter)
            raise "invalid, give me a LETTER"
        end
        letter
    end


end