class Invader
  def initialize(max_width)
    max_starting_x = max_width - size.x
    starting_x = rand(max_starting_x)

    @pos = Vec2D.new(starting_x, 20)
  end

  def size
    Vec2D.new(20, 20)
  end

  def bounds
    Rect.new(@pos, size)
  end

  def vel
    Vec2D.new(0, 1)
  end

  def update
    @pos = @pos.add(vel)
  end
end
