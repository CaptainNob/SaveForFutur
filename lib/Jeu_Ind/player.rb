require 'gosu'

require_relative 'card.rb'

class Player
  attr_accessor :name, :cimetière, :deck

  def initialize(name)
    @name = name
    @cimetière = []
    @deck = []
    creation_deck
  end

  def creation_deck
#    10 Péon : 00
#    6 Troufion : 01
#    4 Brise-Fémur : 03
#    2 Pourfendeur de pance : 05
#    6 Dompteur de Chèvre : 06
#    4 Chevaucheur de Sanglier : 07
#    1 Monteur de Taureau : 08
    for n in 0..10
      @deck << Card.new("image/card/card_00.png", 1, 0, 1, 0)
    end

    for n in 0..6
      @deck << Card.new("image/card/card_01.png", 1, 1, 1, 0)
    end

    for n in 0..4
      @deck << Card.new("image/card/card_03.png", 1, 2, 1, 0)
    end

    for n in 0..2
      @deck << Card.new("image/card/card_05.png", 2, 3, 1, 0)
    end

    for n in 0..6
      @deck << Card.new("image/card/card_06.png", 1, 1, 2, 0)
    end

    for n in 0..4
      @deck << Card.new("image/card/card_07.png", 1, 2, 2, 0)
    end

    @deck << Card.new("image/card/card_08.png", 1, 3, 2, 0)

    @deck << Card.new("image/card/card_12.png", 6, 0, 1, 0)
    @deck << Card.new("image/card/card_13.png", 3, 3, 1, 0)
    @deck << Card.new("image/card/card_14.png", 2, 3, 1, 0)
  end
end
