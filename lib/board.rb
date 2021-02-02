class Board
    attr_accessor :cells

    def initialize
        self.cells= [" "," "," "," "," "," "," "," "," "]
    end

    def reset!
        self.cells= [" "," "," "," "," "," "," "," "," "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "------------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "------------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cell = input.to_i - 1 
        self.cells[cell]
    end

    def full?
        if self.cells.find{|cell| cell == " "} == nil
            true
        else
            false
        end
    end

    def turn_count
        self.cells.find_all{|cell| cell == "O" || cell == "X"}.length
    end

    def taken?(position)
        spot = position.to_i - 1
        if self.cells[spot] == "X" || self.cells[spot] == "O"
            true
        else
            false
        end
    end

    def valid_move?(position)
        if position.to_i > 0 && position.to_i < 10
            if self.taken?(position) 
                false
            else
                true
            end
        end
    end

    def update(input, player)
        position = input.to_i - 1
        self.cells[position] = "#{player.token}"
    end
end