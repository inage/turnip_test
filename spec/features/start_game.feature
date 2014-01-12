# language: ja
# encoding: utf-8

機能:Algoを始める
  背景:二人のユーザーでAlgoを遊ぶために、０から１１の数字が書かれた黒と白の合計２４枚のカードをランダムに並べ替えて山札を作る。そして二人とも山札から手札を４枚取得し、カードに書かれている番号と色を確認する。
  シナリオ: ゲームを開始する
    前提 まだゲームを始めていない
    かつ ユーザー"hoge"とユーザー"fuga"がいる
    もし 新規ゲームをスタートする
    ならば 画面に"Lets play Algo!!"と表示する
    かつ 白と黒が"12"枚ずつ入った"24"枚の山札を作る
    かつ 山札をシャッフルする
    かつ 山札から手札となるカードを上から順番に"2"人に"4"枚ずつ合計"8"枚配る
    かつ 手札を左から数字の小さい順に、白と黒が同じ数字の場合は白を大きい数として扱い並べる
    ならば 分かっている手札のカードの番号と色を表示する
