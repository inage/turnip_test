# -*- coding: utf-8 -*-
module SortTheHandSteps

  step '手札を左から数字の小さい順に、白と黒が同じ数字の場合は白を大きい数として扱い並べる' do
    expect(@user.sort_hand).to
  end

  step '分かっている手札のカードの番号と色を表示する' do
    expect(@user1.hand)
  end
end
