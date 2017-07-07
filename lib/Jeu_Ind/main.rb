require 'rubygems'
require 'gosu'

require_relative 'player.rb'
require_relative 'frame.rb'
require_relative 'plateau.rb'

class Main < Gosu::Window
  def initialize
    @array_of_card = []
    @plat = Plateau.new
    super @plat.largeur, @plat.hauteur, false, 100

    self.caption = "Middle Age Disorder"
    @background_image = Gosu::Image.new("image/Plateau.png", :tileable => true)
    @play1 = Player.new("Joueur 1")
  end

  def update
    if Gosu.button_down? Gosu::MS_RIGHT
      @play1.deck.shuffle!
      @array_of_card << @play1.deck.first
      @array_of_card.last.x = self.mouse_x - 62
      @array_of_card.last.y = self.mouse_y - 84
#      if @array_of_card.empty? == false
#        @array_of_card.each do |card|
#          card.calcul_area
#        end
#      end
    end
      if Gosu.button_down? Gosu::MS_LEFT #&& @array_of_card.empty? == false
        @array_of_card.each do |card|
          card.calcul_area
          if card.area_x.include?(self.mouse_x.to_i) && card.area_y.include?(self.mouse_y.to_i)
            card.x = self.mouse_x - 62
            card.y = self.mouse_y - 84
          end
        end
      end
  end

  def draw
    @background_image.draw(0, 0, 0)
    if @array_of_card.empty? == false
      @array_of_card.each do |card|
        card.draw
      end
    end
  end

  #Pour faire apparaître le curser de la souris
  def needs_cursor?
    true
  end
end

def area_tool(area, coord)
  area.each do |a|
    if a.equal?(coord)
      true
    end
  end
  false
end

Main.new.show
