# -*- coding: utf-8 -*-

module Algo

  class Game
    def initialize

    end

    def start
      "Lets play Algo!!"
    end
  end

  class Card
    attr_accessor :number, :color, :open
    def initialize(number,color)
      @number = number
      @color = color
      @open = false
    end

    def reverse
      !@open
    end

  end


  class Deck < Array
    def initialize
      @deck = []
      12.times{|i|@deck.push Card.new(i,:white)}
      12.times{|i|@deck.push Card.new(i,:black)}
    end

    def shuffle
      @deck.shuffle!
    end

    def left(color)
      if color != :all
        count = 0
        @deck.each{ |card| count +=1 if card.color == color}
        count
      else
        @deck.size
      end
    end
  end
end
