# -*- coding: utf-8 -*-
require "algo"

step 'まだゲームを始めていない' do
  expect(@game).to eq nil
end

step '新規ゲームをスタートする' do
  @game = Algo::Game.new
end

step "画面に:outputと表示する" do |output|
  output = @game.start
  expect(output).to eq 'Lets play Algo!!'
end

step '白と黒が:n1枚ずつ入った:n2枚の山札を作る' do |n1,n2|
  n1,n2 = n1.to_i,n2.to_i
  @deck = Algo::Deck.new
  expect(@deck.left(:all)).to eq n2
  expect(@deck.left(:white)).to eq n1
  expect(@deck.left(:black)).to eq n1
end

step '山札をシャッフルする' do
  expect(@deck.shuffle).not_to eq @deck
end

step '山札から手札となるカードを上から順番に:n1人に:n2枚ずつ合計n3枚配る' do |n1,n2,n3|
  n1,n2,n3 =  n1.to_i,n2.to_i,n3.to_i
end

step "手札のカードの番号と色を表示する" do
end
