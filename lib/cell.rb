class Cell
  attr_reader :parent, :position, :children

  def initialize(args)
    @previous = args.fetch("previous",nil)
    @position = args.fetch("position",[0,0])
    @neighbors = args.fetch("neighbors",nil)
  end


end