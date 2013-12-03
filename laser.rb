require_relative 'rect'
require_relative 'vec2d'

class Laser
  def initialize(pos)
    @pos = pos
  end

  def size
    Vec2D.new(4, 8)
  end

  def bounds
    Rect.new(@pos, size)
  end

  def vel
    Vec2D.new(0, -5)
  end

  def update
    @pos = @pos.add(vel)
  end
end
