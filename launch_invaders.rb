#!/usr/bin/env ruby
require 'gosu'

class LaunchInvaders < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Launch Invaders'
  end

  def update
  end

  def draw
  end
end

window = LaunchInvaders.new
window.show
