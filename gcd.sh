#!/bin/bash
# 引数が2つあるかチェック
if [ $# -ne 2 ]; then
    echo "input 2 argments" 1>&2
    exit 1
fi
# $1が数値または0でないことのチェック
if ! expr "$1" + 0 > /dev/null 2>&1; then
    echo "input natural number" 1>&2
    exit 1
fi
# $1が正の数かチェック
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "input natural number" >&2
    exit 1
fi
# $2が数値かチェック
if ! expr "$2" + 0 > /dev/null 2>&1; then
    echo "input natural number" 1>&2
    exit 1
fi
# $2が正の数かチェック
if ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "input natural number" 1>&2
    exit 1
fi

x="$1"
y="$2"
while [ "$y" -ne 0 ]; do
    r=$(( x % y ))
    x=$y
    y=$r
done
echo "$x"