#!/bin/bash

# ヘルプ表示関数
show_help() {
    echo "使用方法: $0 <演算子> <数値1> <数値2>"
    echo ""
    echo "対応演算子:"
    echo "  +         加算"
    echo "  -         減算"
    echo "  *         乗算（シェルではエスケープ必要: \\*）"
    echo "  x         乗算（エスケープ不要）"
    echo "  mult      乗算（エスケープ不要）"
    echo "  /         除算"
    echo ""
    echo "使用例:"
    echo "  $0 + 1 2        # 出力: 3"
    echo "  $0 \\* 15 20     # 出力: 300"
    echo "  $0 x 15 20      # 出力: 300"
    echo "  $0 mult 15 20   # 出力: 300"
    echo "  $0 '*' 15 20    # 出力: 300 (クォート使用)"
    echo ""
    echo "注意: 全てのエラーケースで \"error\" を出力します"
}

# ヘルプオプションのチェック
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_help
    exit 0
fi

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
    case $1 in
        ''|*[!0-9-]*) return 1 ;;
        -) return 1 ;;
        -*) case ${1#-} in ''|*[!0-9]*) return 1 ;; esac ;;
    esac
    return 0
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
    "*"|"x"|"mult")
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
