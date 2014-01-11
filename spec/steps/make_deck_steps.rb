# -*- coding: utf-8 -*-
require "algo"

module MakeDeckSteps
  attr_accessor :makedeck

  step '白と黒が:n1枚ずつ入った:n2枚の山札を作る' do |n1,n2|
    n1,n2 = n1.to_i,n2.to_i
    @deck = Algo::Deck.new
    expect(@deck.size).to eq n2
    expect(@deck.left(:white)).to eq n1
    expect(@deck.left(:black)).to eq n1
  end

  step '山札をシャッフルする' do
    expect(@deck.shuffle).not_to eq @deck
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
end

RSpec.configure{ |c| c.include MakeDeckSteps, :makedeck => true}
