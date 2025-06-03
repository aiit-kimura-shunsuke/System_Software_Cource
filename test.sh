#!/bin/bash

TARGET="./highest_common_factor.sh"

tmp=/tmp/$$ # 変数を使って表記を短く
echo "input 2 argments" > $tmp-args    # 回答準備：引数の数
echo "input natural number" > $tmp-nat # 回答準備：数字じゃない

# if [[ $result = 1 ]]; then
#     echo "OK"
#     exit 0
# else
#     echo "NG"
#     exit 1
# fi

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


# 引数あり 2つ　文字（空文字列）
# 引数あり 2つ　文字（半角スペース）
# 引数あり 2つ　文字（全角文字）
# 引数あり 2つ　公約数がおかしい
# 引数あり 2つ　公約数があっている
# 引数あり 2つ　公約数があっている　引数を入れ替えて同じ値になるか
# 引数あり 2つ　公約数があっている　両方とも同じ引数
# 引数あり 2つ　公約数があっている　片方が1
# 引数あり 2つ　公約数があっている　互いに素
# 引数あり 2つ　公約数があっている　極端に大きな数
# 引数あり 2つ　0012など先頭にゼロのある整数