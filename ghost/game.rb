require_relative "player.rb"

class Game
    attr_reader :current_player, :previous_player, :dictionary_chomped
    @@alphabet = "abcedfghijklmnopqrstuvwxyz"
    @@dictionary = File.readlines("dictionary.txt")

    def initialize
        @player_1 = Player.new("Victor")
        @player_2 = Player.new("Deb")
        @fragment = ""
        @dictionary_chomped = @@dictionary.map {|word| word.chomp}
        @current_player = @player_1
        @previous_player = @player_2
    end

    def complete?(str)
        return str if @dictionary.any? { |l| l[str] }
        return false
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
            @previous_player = @player_1
        else
            @current_player = @player_1
            @previous_player = @player_2
        end
    end
    
    def take_turn(player)
        p "Give me a letter"

        letter = gets.chomp

        if !@@alphabet.include?(letter)
            raise "give me a letter fool"
        end
        @fragment += letter
    end

    def valid_play?(string)
        if !@@alphabet.include?(string)
            raise "give me a letter fool"
        end

        checking = @fragment + string

        @@alphabet.each_char do |char|
            if !@dictionary.any? { |l| l[checking + char] }
                p "you lose"
                return you lose
        end
    end
                
    #     end
    # end

    # def play_round
end

game = Game.new
p game.dictionary_chomped[1]
# p game.complete?("aple")