# language: ja
# encoding: utf-8

機能:カードに書かれている番号を推測する
  シナリオアウトライン: 相手の手札を指定して番号を予想する
    前提 "自分"と"相手"がゲームを開始している
    かつ 自分の"<手札>"と"<相手の手札>"の番号と色と並び順が表示されている
    かつ "<相手の手札>"の自分から見て左から"<数>"番目のカードは表向き
    かつ "自分"の順番である
    ならば "自分"に山札から"<新しいカード>"が配られる
    かつ 山札からカードが1枚減っている
    ならば "<新しいカード>"が表示される
    もし "自分"は"<相手の手札>"の左から"<num>"番目のカードを"<予想>"した
    ならば 指定したカードは"<結果>"である
  例:
    | 手札        | 相手の手札     | 数 | 新しいカード | num | 予想 | 結果  |
    | w0 b1 w1 w3 | b0 w2 b3 b4 b9 |  1 | b5           |   4 | b10  | false |
    | w0 b1 w1 w3 | b0 w2 b3 b4 b9 |  2 | b5           |   3 | b6   | false |
    | w0 b1 w1 w3 | b0 w2 b3 b4 b9 |  3 | b5           |   2 | w2   | true  |
    | w0 b1 w1 w3 | b0 w2 b3 b4 b9 |  4 | b5           |   1 | b0   | true  |
