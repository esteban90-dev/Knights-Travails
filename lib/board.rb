class Board
  attr_reader :contents

  def initialize(x=8, y=8)
    @contents = create_grid(x,y)
  end

  private

  def create_grid(x,y)
    i = 0 
    j = 0
    grid = Array.new(x){ Array.new(y) }
    while i < x
      while j < y
        grid[i][j] = [i,j]
        j += 1
      end
      puts "#{grid[i]}"
      j = 0
      i += 1
    end
    grid
  end

end