#!/bin/bash
a="$1"
b="$2"

if [ $# -ne 2 ]; then
    echo "input 2 argments" 1>&2
    echo "a"
    exit 1
fi
# $1が数値または0でないことのチェック
if ! expr "$1" + 0 > /dev/null 2>&1; then
    echo "input natural number" 1>&2
    echo "b"
    exit 1
fi
# $1が正の数かチェック
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "input natural number" >&2
    echo "c"
    exit 1
fi
# $2が数値かチェック
if ! expr "$2" + 0 > /dev/null 2>&1; then
    echo "input natural number" 1>&2
    echo "e"
    exit 1
fi
# $2が正の数かチェック
if ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "input natural number" 1>&2
    echo "f"
    exit 1
fi
echo "z"
exit 0