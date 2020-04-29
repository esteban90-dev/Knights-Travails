class KnightPath
  attr_reader :start_position, :board

  def initialize(args)
    @start_position = create_cell(args)
    @board = args.fetch("board")
  end

  public

  def possible_moves(position)
    #given a position, return an array of possible moves
    all_moves(position).select{ |move| board.contains?(move) }
  end

  def shortest_path(end_position)
    #returns shortest path from start to end
    queue = []
    visited_positions = []
    queue << start_position
    
    while queue.length > 0
      puts "queue length: #{queue.length}"
      #dequeue and see if current_position is the destination
      current_position = queue.shift
      if current_position.position == end_position
        return path(start_position, current_position)
      else
        #set current_position's neighbors to all the next available moves
        current_position.neighbors = possible_moves(current_position.position).map do |move|
          create_cell({ "previous" => current_position, "position" => move })
        end

        #enqueue the neighbors
        current_position.neighbors.each{ |neighbor| queue << neighbor }
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