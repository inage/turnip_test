# -*- coding: utf-8 -*-
require "algo"

module DealTheCardsSteps

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
