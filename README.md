# ClassMethod Workshop - 電卓シェルスクリプト

## 概要
このプロジェクトは、基本的な四則演算を行うコマンドライン電卓のシェルスクリプトです。

## 使用方法

### 基本的な演算
```bash
# 加算
sh ./calc.sh + 1 2
# 出力: 3

# 減算
sh ./calc.sh - 5 3
# 出力: 2

# 乗算（複数の方法をサポート）
sh ./calc.sh \* 15 20      # エスケープ使用
sh ./calc.sh x 15 20       # エスケープ不要
sh ./calc.sh mult 15 20    # エスケープ不要  
sh ./calc.sh '*' 15 20     # クォート使用
# すべて出力: 300

# 除算
sh ./calc.sh / 10 2
# 出力: 5
```

### ヘルプ表示
```bash
# ヘルプを表示
sh ./calc.sh --help
sh ./calc.sh -h
```

### エラーハンドリング
```bash
# 無効な演算子
sh ./calc.sh hoge 15 20
# 出力: error

# ゼロ除算
sh ./calc.sh / 10 0
# 出力: error
```

## 特徴
- ✅ 四則演算（+, -, *, /, x, mult）をサポート
- ✅ 乗算の複数記法サポート（エスケープ不要のオプション）
- ✅ ヘルプ機能（--help, -h）
- ✅ 統一されたエラーハンドリング
- ✅ 整数演算のみ（浮動小数点なし）
- ✅ POSIX互換（sh/bashの両方で動作）

## 開発
- **テスト**: 手動実行によるテストケース確認
- **権限**: 実行権限を付与して使用 (`chmod +x calc.sh`)

## AI開発支援
GitHub Copilotの指示書が `.github/copilot-instructions.md` に含まれています。