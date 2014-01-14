# -*- coding: utf-8 -*-
require "algo"

step ':youと:otherがゲームを開始している' do |you,other|
  @game = Algo::Game.new(you,other)
  expect(@game.playing.size).to eq 2
end

step  '自分の:player_handと:opponent_handの番号と色と並び順が表示されている' do |h1,h2|

  [0,1].each do |user|
    data = []
    arr = [h1,h2]
    arr.each do |v|
      v.split(" ").map{|str|
        color,num=str.split("")
        color = (color=="w"? :white: :black)
        data.push Algo::Card.new(num,color)
      }
    end
    @game.playing[user].hand = data
  end
  @player = @game.playing.first
  @opp = @game.playing.last
  expect(@game.show(@player)).to eq [{ :player => @player.hand },{  :opponent => @opp.hand.reverse }]
end

step  ':opponent_handの自分から見て左から:num番目のカードは表向き' do |cards,num|
  data = []
  show_opp_hand = []
  n = num.to_i
  cards.split(" ").map{|str|
    color,number=str.split("")
    color = (color=="w"? :white: :black)
    data.push Algo::Card.new(number,color)
    show_opp_hand.push [number.to_i,color,false]
  }
  show_opp_hand[-n][2] = true
  data[-n].flip!
  @game.playing.last.hand = data
  expect(@game.show(@player)).to eq [{ :player => @player.hand },{  :opponent => show_opp_hand.reverse }]
end

step  '"自分"の順番である' do
  expect(@game.turn).to eq @player
end

step  '"自分"に山札から:new_cardが配られる' do |new_card|
  #山札から deal :new_card
  pending
  @game.turn.hand
end
