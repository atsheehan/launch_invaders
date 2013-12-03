class World
  attr_reader :invaders

  def initialize(width, height, invader_count)
    @width = width
    @height = height
    @invaders_remaining = invader_count
    @spawn_delay = 0
    @invaders = []
    @player = Player.new(width, height)
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

    @player.update()
  end

  def player
    @player
  end

  def player_accelerate_right
    @player.accelerate(:right)
  end

  def player_accelerate_left
    @player.accelerate(:left)
  end

  def player_fire_laser
    puts "pew pew pew"
  end

  def player_decelerate_right
    @player.decelerate(:right)
  end

  def player_decelerate_left
    @player.decelerate(:left)
  end
end

class Player
  def initialize(width, height)
    starting_x = (width - size.x) / 2
    starting_y = 9 * height / 10

    @pos = Vec2D.new(starting_x, starting_y)
    @accel_left = 0
    @accel_right = 0
  end

  def size
    Vec2D.new(20, 20)
  end

  def vel
    Vec2D.new(@accel_left + @accel_right, 0)
  end

  def bounds
    Rect.new(@pos, size)
  end

  def update
    @pos = @pos.add(vel)
  end

  def accelerate(direction)
    case direction
    when :left
      @accel_left = -1
    when :right
      @accel_right = 1
    end
  end

  def decelerate(direction)
    case direction
    when :left
      @accel_left = 0
    when :right
      @accel_right = 0
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

  def vel
    Vec2D.new(0, 1)
  end

  def update
    @pos = @pos.add(vel)
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

  def add(other)
    Vec2D.new(x + other.x, y + other.y)
  end
end
