require "./lib/knight_path.rb"
require "./lib/cell.rb"
require "./lib/board.rb"


def knight_moves(start_position, end_position)
  board1 = Board.new

  #check and see if start/end positions are valid
  raise "Invalid start position given board size" unless board1.contains?(start_position)
  raise "Invalid end position given board size" unless board1.contains?(end_position)

  trip1 = KnightPath.new({
    "position" => start_position,
    "board" => board1
  })

  trip1.shortest_path(end_position).each{ |point| puts "#{point}" }
end

knight_moves([0,0],[1,0])


