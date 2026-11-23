## 開発者の主な開発領域

- ROSアプリケーション
- ロボットビジョン
- AIエージェントアプリケーション
- フロントエンドアプリケーション
- バックエンドアプリケーション


## GitHub Copilot Harness構成

```
my-project/
├── .github/
│   ├── instructions/
│   │   ├── common/                         # common/ のみ自動適用
│   │   │   ├── python.instructions.md
│   │   │   ├── typescript.instructions.md
│   │   │   └── env.instructions.md         # PC環境情報
│   │   ├── ros/
│   │   │   └── ros2.instructions.md
│   │   ├── frontend/
│   │   │   └── react.instructions.md
│   │   └── backend/
│   │       └── fastapi.instructions.md
│   ├── skills/
│   │   ├── readme-generator/
│   │   │   └── SKILL.md             # Readme作成Skill
│   │   └── git-workflow/
│   │       └── SKILL.md             # Git管理Skill
│   ├── agents/
│   │   ├── error-debugger.agent.md  # エラー原因調査Agent
│   │   └── log-curator.agent.md     # トランスクリプトから気づきを抽出しハーネスを更新するAgent
│   ├── hooks/
│   │   ├── notification.json        # Stop時に完了通知
│   │   ├── save-transcript.json     # Stop / SessionEnd時にトランスクリプトを自動蓄積
│   │   └── save-transcript.sh       # 蓄積スクリプト（追記のみ。要約・判断はしない）
│   ├── plans/
│   │   └── plan-YYYYMMDD-HHMMSS.md  # python.instructions.mdの計画ゲートで実行時生成
│   └── logs/
│       ├── raw/                     # フックが自動蓄積するトランスクリプト（gitignore対象）
│       │   └── YYYYMMDD.md
│       └── .curated.json            # 棚卸し状態（抽出済み範囲と判断記録）
├── .vscode/
│   └── settings.json                # auto-approve設定
├── .gitignore
└── AGENTS.md                        # ルート指示ファイル
```
