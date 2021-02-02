class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        if board.turn_count.odd? == true
            return self.player_2
        else 
           return self.player_1
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if board.taken?("#{combo[0] + 1}") && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]]
                return combo
            else
                false
            end
        end
        if board.turn_count == 9
            return false
        end
    end

    def draw?
        if !self.won? && board.full?
            true
        else
            false
        end 
    end
    
    def over?
        if self.won? || self.draw?
            true 
        else
            false
        end
    end

    def winner
        if self.won?
            combo = self.won? 
            board.cells[combo[0]]
        else
           nil
        end
    end

    def turn
        if board.turn_count.even?
            player = player_1
        else
            player = player_2
        end 
        input = player.move(board)
        if board.valid_move?(input)
            board.update(input, player)
        else
            turn
        end      
    end

    def play
        until over?
        turn
        end

        if winner 
            puts "Congratulations #{self.winner}!"
        else 
            puts "Cat's Game!"
        end
    end

end