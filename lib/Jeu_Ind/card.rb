require 'gosu'

class Card
  attr_accessor :x, :y, :area_x, :area_y
  attr_reader :image, :hp, :ap, :mp, :food, :ability

  def initialize(image, hp, ap, mp, food)
    # 125*170
    @image = image
    @hp = hp
    @ap = ap
    @mp = mp
    @food = food
  end

  def calcul_area
    @area_y = []
    deb_y = @y.to_i
    fin_y = @y-169.to_i

    for i in deb_y..fin_y
      @area_y << i
      i += 1
    end

    @area_x = []
    deb_x = @x.to_i
    fin_x = @x+124.to_i

    for j in deb_x..fin_x
      @area_x << j
      j += 1
    end
  end

  def draw
    Gosu::Image.new(@image, :tileable => true).draw(@x, @y, 1)
  end
end
