class KnightPath
  attr_reader :start_cell, :board

  def initialize(args)
    @start_cell = create_cell(args)
    @board = args.fetch("board")
  end

  public

  def possible_moves(cell)
    #given a cell, return an array of possible moves
    all_moves(cell).select{ |move| board.contains?(move) }
  end

  def shortest_path(end_cell)
    #returns shortest path from start to end
    queue = []
    visited_cells = []
    queue << start_cell
    
    while queue.length > 0
      #dequeue
      current_cell = queue.shift
      visited_cells << current_cell.position

      if current_cell.position == end_cell
        return path(start_cell, current_cell)
      else
        #set current_cell's neighbors to all the next available moves
        current_cell.neighbors = possible_moves(current_cell.position).map do |move|
          create_cell({ "previous" => current_cell, "position" => move })
        end

        #enqueue the neighbors that have not been visited yet
        current_cell.neighbors.each do |neighbor| 
          queue << neighbor unless visited_cells.include?(neighbor.position)
        end
      end
    end
  end

  def all_moves(cell)
    #returns all possible cell coordinates a knight can move to from its current cell in one move
    delta_x = [1,2,2,1,-1,-2,-2,-1]
    delta_y = [2,1,-1,-2,-2,-1,1,2]
    result = []
    i = 0
    while i < delta_x.length
      result << [ cell[0] + delta_x[i], cell[1] + delta_y[i] ]
      i += 1
    end
    result
  end

  private

  def path(source, destination)
    result = []
    loop do
      result.unshift(destination.position)
      break if destination.position == source.position
      destination = destination.previous
    end
    result
  end

  def create_cell(input)
    Cell.new(input)
  end

end