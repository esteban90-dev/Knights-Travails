class Cell
  attr_reader :parent, :position
  attr_accessor :neighbors

  def initialize(args)
    @previous = args.fetch("previous",nil)
    @position = args.fetch("position",[0,0])
    @neighbors = args.fetch("neighbors",nil)
  end


end