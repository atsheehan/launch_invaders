class World
  attr_reader :invaders

  def initialize(width, height, invader_count)
    @width = width
    @height = height
    @invaders_remaining = invader_count
    @spawn_delay = 0
    @invaders = []
  end

  def update
    if @invaders_remaining > 0
      if @spawn_delay <= 0
        @invaders << Invader.new(@width)
        @spawn_delay = rand(100)
        @invaders_remaining -= 1
      else
        @spawn_delay -= 1
      end
    end

    @invaders.each do |invader|
      invader.update()
    end
  end
end

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

  def update
    @pos = @pos.add(0, 1)
  end
end

class Rect
  def initialize(origin, size)
    @origin = origin
    @size = size
  end

  def top
    @origin.y
  end

  def bottom
    @origin.y + @size.y
  end

  def left
    @origin.x
  end

  def right
    @origin.x + @size.x
  end
end

class Vec2D
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def add(x, y)
    Vec2D.new(@x + x, @y + y)
  end
end
