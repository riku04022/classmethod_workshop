#!/bin/bash

# 引数の数をチェック
if [ $# -ne 3 ]; then
    echo "error"
    exit 1
fi

# 引数を変数に格納
operator=$1
num1=$2
num2=$3

# 数値チェック関数
is_number() {
    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# 引数が数値かチェック
if ! is_number "$num1" || ! is_number "$num2"; then
    echo "error"
    exit 1
fi

# 演算子に応じて計算を実行
case $operator in
    "+")
        result=$((num1 + num2))
        echo $result
        ;;
    "-")
        result=$((num1 - num2))
        echo $result
        ;;
    "*")
        result=$((num1 * num2))
        echo $result
        ;;
    "/")
        if [ $num2 -eq 0 ]; then
            echo "error"
            exit 1
        fi
        result=$((num1 / num2))
        echo $result
        ;;
    *)
        echo "error"
        exit 1
        ;;
esac
