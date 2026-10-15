---
applyTo: "**/*.py"
description: "Coding conventions for Python."
---

## 開発ワークフロー

1. まず `.github/plans/plan-YYYYMMDD-HHMMSS.md`（実行時の年月日時分秒をファイル名に付与）に計画を書く（コードは書かない）
2. 人間が計画ファイルをレビューしてから計画を確定
3. 計画ファイルのステップごとに実装
4. 各ステップ完了後、必ず停止して人間のレビューを待つ
5. 次のステップに進む指示があるまでコードを書かない
6. タスク完了後は変更内容と理由を要約

## コーディング規約

- 引数・戻り値には型ヒントを付与
- 説明的な変数名を使用
- マジックナンバーは定数として切り出す
- 関数の1行目にDocstring """説明""" を記述
- コメントは英語で記述
- 1関数あたり最大50行を目安とする
- 関数は `main` から呼び出される順に上から配置する
- エントリポイントは `if __name__ == "__main__":` ガードを必ず付ける
- ローカルファイルアクセスは `pathlib.Path` で構築

## パッケージマネージャ

- **uv** を使用
- 依存追加: `uv add <package>`
- 開発ツール（ruff, pytest, mypy 等）は `--dev` で追加
- 開発用依存追加: `uv add --dev <package>`
- スクリプト実行: `uv run python <script>`
- 同期: `uv sync`
- リント `uv run ruff check <script>.py`
- フォーマット `uv run ruff format <script>.py`
