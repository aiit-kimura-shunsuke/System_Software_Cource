#!/bin/bash

TARGET="./gcd.sh"

tmp=/tmp/$$ # 変数を使って表記を短く
echo "input 2 argments" > $tmp-args    # 回答準備：引数の数
echo "input natural number" > $tmp-nat # 回答準備：数字じゃない

ERROR_EXIT () {
  echo "$1" >&2   # エラーメッセージ(引数1)を標準エラー出力に表示
  rm -f $tmp-*    # 作った一時ファイルをまとめて削除
  exit 1          # エラー終了
}

# テスト開始
# 引数なし
"$TARGET" 2>$tmp-ans && ERROR_EXIT "error in test01-1"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test01-2"
# 引数あり 1つ
"$TARGET" 1 2>$tmp-ans && ERROR_EXIT "error in test02-1"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test02-2"
# 引数あり 3つ
"$TARGET" 1 2 3 2>$tmp-ans && ERROR_EXIT "error in test03-1"
diff $tmp-ans $tmp-args || ERROR_EXIT "error in test03-2"
# 引数あり 2つ　$1が0
"$TARGET" 0 40 2>$tmp-ans && ERROR_EXIT "error in test04-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test04-2"
# 引数あり 2つ　$1が負の数
"$TARGET" -1 13 2>$tmp-ans && ERROR_EXIT "error in test05-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test05-2"
# 引数あり 2つ　$2が0
"$TARGET" 12 0 2>$tmp-ans && ERROR_EXIT "error in test06-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test06-2"
# 引数あり 2つ　$2が負の数
"$TARGET" 8 -4 2>$tmp-ans && ERROR_EXIT "error in test07-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test07-2"
# 引数あり 2つ　$1が小数
"$TARGET" 12.5 12 2>$tmp-ans && ERROR_EXIT "error in test08-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test08-2"
# 引数あり 2つ　$2が小数
"$TARGET" 12 12.5 2>$tmp-ans && ERROR_EXIT "error in test09-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test09-2"
# 引数あり 2つ　$1に先頭にゼロ付き数字
"$TARGET" 05 80 2>$tmp-ans && ERROR_EXIT "error in test10-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test10-2"
# 引数あり 2つ　$2に先頭にゼロ付き数字
"$TARGET" 5 080 2>$tmp-ans && ERROR_EXIT "error in test11-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test11-2"
# 引数あり 2つ　$1が空文字列
"$TARGET" "" 80 2>$tmp-ans && ERROR_EXIT "error in test12-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test12-2"
# 引数あり 2つ　$1が空文字列
"$TARGET" 40 ”” 2>$tmp-ans && ERROR_EXIT "error in test13-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test13-2"
# 引数あり 2つ　$1が半角スペース
"$TARGET" " " 80 2>$tmp-ans && ERROR_EXIT "error in test14-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test14-2"
# 引数あり 2つ　$2が半角スペース
"$TARGET" 50 " " 2>$tmp-ans && ERROR_EXIT "error in test15-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test15-2"
# 引数あり 2つ　$1が全角文字
"$TARGET" "あ" 80 2>$tmp-ans && ERROR_EXIT "error in test16-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test16-2"
# 引数あり 2つ　$2が全角文字
"$TARGET" 18 "い" 2>$tmp-ans && ERROR_EXIT "error in test17-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test17-2"
# 引数あり 2つ　$1が半角文字
"$TARGET" "a" 80 2>$tmp-ans && ERROR_EXIT "error in test18-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test18-2"
# 引数あり 2つ　$2が半角文字
"$TARGET" 12 "b" 2>$tmp-ans && ERROR_EXIT "error in test19-1"
diff $tmp-ans $tmp-nat || ERROR_EXIT "error in test19-2"

# 引数あり 2つ　公約数があっている　互いに素
echo "1" > $tmp-exp
"$TARGET" 2 3 > $tmp-ans || ERROR_EXIT "error in test20-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test20-2"
# 引数あり 2つ　公約数があっている
echo "6" > $tmp-exp
"$TARGET" 48 18 > $tmp-ans || ERROR_EXIT "error in test21-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test21-2"
# 引数あり 2つ　公約数があっている　引数を入れ替えて同じ値になるか
echo "6" > $tmp-exp
"$TARGET" 18 48 > $tmp-ans || ERROR_EXIT "error in test22-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test22-2"
# # 正常系: 同じ引数 (7, 7) → 7
echo "7" > $tmp-exp
"$TARGET" 7 7 > $tmp-ans || ERROR_EXIT "error in test23-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test23-2"
# 引数あり 2つ　公約数があっている　片方が1
echo "1" > $tmp-exp
"$TARGET" 1 10 > $tmp-ans || ERROR_EXIT "error in test24-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test24-2"
# 引数あり 2つ　公約数があっている　大きな数
echo "12" > $tmp-exp
"$TARGET" 123456 789012 > $tmp-ans || ERROR_EXIT "error in test25-1"
diff $tmp-ans $tmp-exp || ERROR_EXIT "error in test25-2"
