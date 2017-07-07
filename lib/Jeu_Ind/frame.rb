require 'gosu'
require_relative 'player.rb'

class Frame < Gosu::Window
  def initialize(player)
    super 640, 480
    self.caption = player.name
  end

  def update
  end

  def draw
  end
end
