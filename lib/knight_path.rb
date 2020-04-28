class KnightPath
  attr_reader :source_position

  def initialize(input=[0,0])
    @source = create_cell(input)
  end

  public

  def possible_moves
    #given a position, return an array of possible moves
    #1. Given the source position, spit out all 8 moves 
    #2. Check board and remove invalid positions
    #3. Return result
  end


  def all_moves(position)
    delta_x = [1,2,2,1,-1,-2,-2,1]
    delta_y = [2,1,-1,-2,-2,-1,1,2]
    result = []
    i = 0

    while i < x.length
      result << []
      i += 1
    end

  end

  private

  def create_cell(input)
    Cell.new({
      "position" => input
    })
  end

end