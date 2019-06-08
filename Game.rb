# require_relative 'Player'

class Game
    WIN_SCORE = 5
    OPTIONS = ['rock', 'paper', 'scissors']

    def initialize    
        @player_one = Player.new
        @player_two = Player.new
        puts "Welcome to Rock, Paper, Scissors Game \n\n"
    end

    def compare
        if @player_one.choice == @player_two.choice
            puts "Tie"
        elsif @player_one.choice == "rock" && @player_two.choice == "scissors"
            puts "Player Wins"
            @player_one.score = @player_one.score + 1
        elsif @player_one.choice == "rock" && @player_two.choice == "paper"
            puts "Computer Wins"
            @player_two.score = @player_two.score + 1
        elsif @player_one.choice == "scissors" && @player_two.choice == "paper"
            puts "Player Wins"
            @player_one.score = @player_one.score + 1
        elsif @player_one.choice == "scissors" && @player_two.choice == "rock"
            puts "Computer Wins"
            @player_two.score = @player_two.score + 1
        elsif @player_one.choice == "paper" && @player_two.choice == "rock"
            puts "Player Wins"
            @player_one.score = @player_one.score + 1
        elsif @player_one.choice == "paper" && @player_two.choice == "scissors"
            puts "Computer Wins"
            @player_two.score = @player_two.score + 1
        else
            puts "Game is Invalid"
        end
    end

    def play_game
        while @player_one.score < WIN_SCORE && @player_two.score < WIN_SCORE
            @player_one.choice = rock_paper_scissors
            @player_two.choice = rock_paper_scissors_computer(@player_two)
            player_choices()    
            #compare(@player_one, @player_two)
            compare()
            
            scores()
        end
    end

    def player_choices
        puts "Player one choice: #{@player_one.choice}"
        puts "Player two choice: #{@player_two.choice}"
    end

    def rock_paper_scissors
        puts "Please select a letter from the menu"
        menu = ['rock', 'paper', 'scissors']
        menu.each do |menu_option|
            puts menu_option
        end
        gets.chomp.downcase.strip
    end
    
    def rock_paper_scissors_computer(player)
        @player_two.choice = OPTIONS.sample
    end

    def scores
        puts "Player One's Score: #{@player_one.score}"
        puts "Player Two's Score: #{@player_two.score}"
    end
end

# rpc = Game.new
# rpc.play_game