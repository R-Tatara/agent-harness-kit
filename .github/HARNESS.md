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
│   │   │   └── env.instructions.md         # 環境情報
│   │   ├── ros/
│   │   │   └── ros2.instructions.md
│   │   ├── frontend/
│   │   │   └── react.instructions.md
│   │   └── backend/
│   │       └── fastapi.instructions.md
│   ├── skills/
│   │   ├── readme-generator/
│   │   │   └── SKILL.md             # Readme作成Skill
│   │   ├── git-workflow/
│   │   │   └── SKILL.md             # Git管理Skill
│   │   └── log-issue/
│   │       └── SKILL.md             # 対話内容をログ保存するSkill
│   ├── agents/
│   │   ├── error-debugger.agent.md  # エラー原因調査エージェント
│   │   └── log-curator.agent.md     # ログ集計エージェント
│   ├── hooks/
│   │   └── notification.json
│   ├── plans/
│   │   └── plan-YYYYMMDD-HHMMSS.md  # python.instructions.mdの計画ゲートで実行時生成
│   └── logs/
│       └── *.log                    # log-capture hooksにより生成
├── .vscode/
│   └── settings.json                # auto-approve設定
├── .gitignore
└── AGENTS.md                        # ルール
```