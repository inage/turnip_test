# -*- coding: utf-8 -*-
require "algo"


step 'まだゲームを始めていない' do
  expect(@game).to eq nil
end

step 'ユーザー:nameとユーザー:nameがいる' do |user1,user2|
  @user1 = Algo::User.new(user1)
  @user2 = Algo::User.new(user2)
  expect(@user1).not_to eq @user2
  expect(@user1.name).to eq user1
  expect(@user2.name).to eq user2
end

step '新規ゲームをスタートする' do
  @game = Algo::Game.new(:user1,:user2)
  expect(@game).not_to eq nil
end

step "画面に:m1と表示する" do |m1|
  @game.start
  expect(@game.output).to eq m1
end

step '白と黒が:n1枚ずつ入った:n2枚の山札を作る' do |n1,n2|
  n1,n2 = n1.to_i,n2.to_i
  @deck = Algo::Deck.new
  expect(@deck.size).to eq n2
  expect(@deck.left(:white)).to eq n1
  expect(@deck.left(:black)).to eq n1
end

step '山札をシャッフルする' do
  shuffled_deck = @deck.stub(:shuffle)
  allow(shuffled_deck).to receive(:shuffle)
end

step '山札から手札となるカードを上から順番に:n1人に:n2枚ずつ合計:n3枚配る' do |n1,n2,n3|
  n1,n2,n3 =  n1.to_i,n2.to_i,n3.to_i
  expect(@deck.size).to eq 24

  @user1.hand = @deck.deal n2
  expect(@user1.hand.size).to eq n2
  expect(@deck.size).to eq 24-n2

  @user2.hand = @deck.deal n2
  expect(@user2.hand.size).to eq n2
  expect(@deck.size).to eq 24-n2*n1

  expect(@deck.size).to eq 24-n3
end

step '手札を左から数字の小さい順に、白と黒が同じ数字の場合は白を大きい数として扱い並べる' do
  @user = Algo::User.new(:user)
  user_have_sorted_hand = Algo::User.new(:user)
  black0 = Algo::Card.new(0,:black)
  black3 = Algo::Card.new(3,:black)
  black10 = Algo::Card.new(10,:black)
  white4 = Algo::Card.new(4,:white)
  white10 = Algo::Card.new(10,:white)
  @user.hand = [black0,black3,white4,white10,black10]
  user_have_sorted_hand.hand = [black0,black3,white4,black10,white10]
  expect(@user.hand).to eq user_have_sorted_hand.hand
end

step '分かっている手札のカードの番号と色を表示する' do
  @game = Algo::Game.new(:user1,:user2)
  @player = @game.playing.first
  @opp = @game.playing.last
  expect(@game.show(@player)).to eq [{ :player => @player.hand },{ :opponent => @opp.hand.reverse }]
end
