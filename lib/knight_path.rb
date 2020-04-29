class KnightPath
  attr_reader :start_point, :board

  def initialize(args)
    @start_point = create_cell(args)
    @board = args.fetch("board")
  end

  public

  def possible_moves(position)
    #given a position, return an array of possible moves
    all_moves(position).select{ |move| board.contains?(move) }
  end

  def shortest_path(end_point)
    #returns shortest path from start to end
    queue = []
    queue << start_point
    
    while queue.length > 0
      #dequeue and see if current_position is the destination
      current_point = queue.shift
      if current_point.position == end_point
        return path(start_point, current_point)
      else
        #set current_point's neighbors to all the next available moves
        current_point.neighbors = possible_moves(current_point.position).map do |move|
          create_cell({ "previous" => current_point, "position" => move })
        end

        #current_point.neighbors.each{ |neighbor| puts neighbor.previous }
        
        #enqueue the neighbors
        current_point.neighbors.each{ |neighbor| queue << neighbor }

        
      end
    end
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

  def path(start_point, end_point)
    result = []
    loop do
      result << end_point.position
      break if end_point.position == start_point.position
      end_point = end_point.previous
    end
    result
  end

  def create_cell(input)
    Cell.new(input)
  end

end