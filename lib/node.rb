class Node
  attr_reader :parent, :position, :children

  def initialize(input=[0,0])
    @parent = args.fetch("parent")
    @position = args.fetch("position")
    @children = args.fetch("children")
  end


end