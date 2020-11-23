class TicTacToe

    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2], #top
        [3,4,5], #mid
        [6,7,8], #bot
        [0,3,6], #downLeft
        [1,4,7], #downMid
        [2,5,8], #downRight
        [0,4,8], #diagnalLeft
        [2,4,6]  #diagnalRight
    ]

    @board

    def initialize
        @board = [" ", " ", " ", 
                  " ", " ", " ",
                   " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def input_to_index(input)
        index = input.to_i
        return index -= 1
    end

    def move(position, piece = "X")
        locale = input_to_index(position)
        position_taken?(locale)
        @board[locale] = piece
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

        puts "Please select a location (1-9):"
        input = gets
        input = input_to_index(input)
        current = current_player
        if valid_move?(input)
            move(input, current)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each do |win|
            windex1 = win[0]
            windex2 = win[1]
            windex3 = win[2]

            posi1 = @board[windex1]
            posi2 = @board[windex2]
            posi3 = @board[windex3]

            if((posi1 == "X") && (posi2 = "X") && (posi3 = "X"))
                return win
            elsif((posi1 == "O") && (posi2 = "O") && (posi3 = "O"))
                return win
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
            if @board[winSide][0] == "X"
                return "X"
            else
                return "O"
            end
        else
            return nil
        end
    end

end