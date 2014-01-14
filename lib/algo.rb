# -*- coding: utf-8 -*-

module Algo


  class Game < Array
    attr_accessor :output
    attr_reader :playing, :deck
    def initialize(user1,user2)
      @playing = [User.new(user1),User.new(user2)]
      @deck = Algo::Deck.new
    end

    def turn
      @playing.first
    end

    def start
      @output = "Lets play Algo!!"
    end

    def show(user)
      @user = user
      @opp = @playing.reject{|u| u.name == @user.name }.first
      @output = [{ :player => @user.hand },{ :opponent => @opp.hand.reverse }]
    end

  end

  class User
    attr_accessor :name
    attr_writer :hand
    def initialize(name)
      @name = name
      @hand = []
    end

    def hand
      sort
      cards = []
      @hand.each do |card|
        cards.push [card.number,card.color,card.open]
      end
      cards
    end

    private
    def sort
      @hand.sort_by! do|a|
        a.index
      end
    end
  end

  class Card
    attr_reader :number, :color, :open, :index
    def initialize(number,color)
      @number = number.to_i
      @color = color
      @open = false
      @index = (@color == :white)? @number+0.5 : @number
    end

    def flip!
      @open = !@open
    end
  end

  class Deck
    Num = 12
    def initialize
      @deck = []
      Num.times{|i|@deck.push Card.new(i,:white)}
      Num.times{|i|@deck.push Card.new(i,:black)}
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
