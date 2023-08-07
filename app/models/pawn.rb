class Pawn
  include ActiveModel::Validations
  include Singleton

  attr_accessor :x, :y, :facing, :color
  validates :x, presence: true, inclusion: 0..7
  validates :y, presence: true, inclusion: 0..7
  validates :facing, inclusion: { in: %w[NORTH SOUTH EAST WEST] }
  validates :color, inclusion: { in: %w[WHITE BLACK] }

  LEFT = { "NORTH" => "WEST", "WEST" => "SOUTH", "SOUTH" => "EAST", "EAST" => "NORTH" }
  RIGHT = LEFT.invert

  def move(move = 1)
    if valid_move?(move)
      move_along_axis(move)
    end
  end

  def left
    @facing = LEFT[facing.upcase]
    self
  end

  def right
    @facing = RIGHT[facing.upcase]
    self
  end

  def report
    "#{@x},#{@y},#{@facing},#{@color}"
  end

  def place(x, y, facing, color)
    @x = x
    @y = y
    @facing = facing
    @color = color
    self
  end

  def valid_move?(move)
    if @facing == 'NORTH' && @y + move < 8
      return true
    elsif @facing == 'SOUTH' && @y - move >= 0
      return true
    elsif @facing == 'EAST' && @x + move < 8
      return true
    elsif @facing == 'WEST' && @x - move >= 0
      return true
    end

    return false
  end

  def reset_instance
    @x = nil
    @y = nil
    @facing = nil
    @color = nil
  end

  def move_along_axis(moves)
    if @facing == 'NORTH'
      @y += moves
    elsif @facing == 'SOUTH'
      @y -= moves
    elsif @facing == 'EAST'
      @x += moves
    elsif @facing == 'WEST'
      @x -= moves
    end
  end

end
