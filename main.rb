require "./lib/knight_path.rb"
require "./lib/cell.rb"
require "./lib/board.rb"


def knight_moves(start_position, end_position)
  board1 = Board.new

  #check and see if start/end positions are valid
  raise "Invalid start position given board size" unless board1.contains?(start_position)
  raise "Invalid end position given board size" unless board1.contains?(end_position)

  puts "finding the shortest path between #{start_position} and #{end_position}...."

  trip1 = KnightPath.new({
    "position" => start_position,
    "board" => board1
  })

  path = trip1.shortest_path(end_position)
  path.each{ |point| puts "#{point}" }
  puts "the knight made the trip in #{path.length - 1} moves"
end

puts "Enter the starting x position of the knight (between 0 and 7)"
start_position_x = gets.chomp.to_i

puts "Enter the starting y position of the knight (between 0 and 7)"
start_position_y = gets.chomp.to_i

puts "Enter the ending x position of the knight (between 0 and 7)"
end_position_x = gets.chomp.to_i

puts "Enter the ending y position of the knight (between 0 and 7)"
end_position_y = gets.chomp.to_i

knight_moves([start_position_x, start_position_y], [end_position_x, end_position_y])


