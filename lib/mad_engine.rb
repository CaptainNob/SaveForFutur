require 'gosu'

class MadEngine < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Middle Age Disorder"
  end
  
  def update
    puts "let's a go"
  end
  
  def draw
    puts "let's a go"
  end
end