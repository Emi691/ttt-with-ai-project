module Players
    class Computer < Player
        def move(board)
            number = rand(1-9)
            input = number.to_s
            if board.valid_move?(input)
                input
            else
                move
            end
        end
    end
end