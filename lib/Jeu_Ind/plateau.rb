require 'gosu'

#require_relative 'ZOrder.rb'

class Plateau
  attr_accessor :hauteur, :largeur, :array
  def initialize
    @hauteur = 1000
    @largeur = 1429
    @array = []
    creation_case
  end
  def creation_case
    # Largeur = 130
    # Hauteur = 187
    # x to x = 145
    # y to y = 200
    # Coté 15
    @x = 8
    @y = 8
    for i in 0..9
      for j in 0..4
        @array << Case.new(@x, @y)
        j += 1
        @x += 145
      end
      @x = 8
      @y += 200
      i += 1
    end
  end
end

class Case
  attr_accessor :x, :y, :area

  def initialize(x, y)
    @x = x
    @y = y
    @area = []
    for i in @y..@y+186
      for j in @x..@x+129
        @area << j
        j += 1
      end
      @area << i
      i += 1
    end
  end
end
