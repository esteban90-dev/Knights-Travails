class KnightPath
  attr_reader :source, :board

  def initialize(input=[0,0])
    @source = create_cell(input)
    @board = Board.new
  end

  public

  def possible_moves(position)
    #given a position, return an array of possible moves
    all_moves(position).select{ |move| board.contains?(move) }
  end


  def all_moves(position)
    #returns all possible cell coordinates a knight can move to from its current position in one move
    delta_x = [1,2,2,1,-1,-2,-2,-1]
    delta_y = [2,1,-1,-2,-2,-1,1,2]
    result = []
    i = 0
    while i < delta_x.length
      result << [ position[0] + delta_x[i], position[1] + delta_y[i] ]
      i += 1
    end
    result
  end

  private

  def create_cell(input)
    Cell.new({
      "position" => input
    })
  end

end