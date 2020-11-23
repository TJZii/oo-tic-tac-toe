class TicTacToe

    attr_accessor :board, :choose

    WIN_COMBINATIONS = [
        [0,1,2], #top
        [3,4,5], #mid
        [6,7,8], #bot
        [0,3,6], #downLeft
        [1,4,7], #downMid
        [2,5,8], #downRight
        [0,4,8], #diagnalLeft
        [2,4,6],  #diagnalRight
    ]

    @board

    def initialize
        @board = [" ", " ", " ", 
                  " ", " ", " ",
                   " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        @choose = input.to_i
        @choose -= 1
    end

    def move(position, piece = "X")
        position_taken?(position)
        @board[input_to_index(position) + 1] = "#{piece}"
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        if (index > 8) || (index < 0)
            return false
        elsif @board[index] == " "
            return true
        else 
            return false
        end
    end

    def turn_count
        counter = 0
        @board.each do |spot|
            if (spot == "X" || spot == "O")
                counter += 1
            end
        end
        return counter
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Choose a number from 1-9:"
        index = input_to_index(gets.strip)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
        @board
    end

    def won?
        WIN_COMBINATIONS.each do |win|

            newarra = []

            windex1 = win[0]
            windex2 = win[1]
            windex3 = win[2]

            posi1 = @board[windex1]
            posi2 = @board[windex2]
            posi3 = @board[windex3]

            newarra << win[0]
            newarra << win[1]
            newarra << win[2]

            if((posi1 == "X") && (posi2 == "X") && (posi3 == "X"))
                return newarra
            elsif((posi1 == "O") && (posi2 == "O") && (posi3 == "O"))
                return newarra
            else
                return false
            end
        end
    end

    def full?
        if @board.detect {|i| i == " " || i == nil}
          return false
        else
          return true
        end
    end

    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def over?
        if draw? || won?
            return true
        else
            return false
        end
    end

    def winner
        winSide = won?
        if winSide
            return winSide.first
        else
            return nil
        end
    end

    def play
        until over?
            current_player
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cats Game!"
        end
    end

end