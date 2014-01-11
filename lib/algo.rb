# -*- coding: utf-8 -*-

module Algo

  class Game
    def initialize
      @output = nil
    end

    def start
      "Lets play Algo!!"
    end
  end

  class User
    attr_accessor :name, :hand

    def initialize(name)
      @name = name
      @hand = []
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


  class Deck
    def initialize
      @deck = []
      12.times{|i|@deck.push Card.new(i,:white)}
      12.times{|i|@deck.push Card.new(i,:black)}
    end

    def shuffle
      @deck.shuffle!
    end

    def size
      @deck.size
    end

    def deal(num)
      cards = []
      num.times do
        cards.push @deck.pop
      end
      cards
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
