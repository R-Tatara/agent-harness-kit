---
description: "Web application design guidelines for React frontend. Attach manually when needed."
---

# Web Application Design Guidelines

Implement working code that is production-grade, visually refined, and cohesive.

## Core Principles

- 機能優先。UIはその手段。
- コンポジションを優先し、不要な複雑さを避ける。

## デザイン

- **Design Thinking**: What problem does this interface solve?
- **Typography**: Inter
- **Theme**: Minimal / Clean / Flat
- **Motion**: マイクロインタラクションにアニメーションを活用
- **Layout**: グリッドベース、レスポンシブ

## カラーテーマ

```css
:root {
  --bg-base:        #f0f2f4;   /* Page background          */
  --bg-surface:     #ffffff;   /* Card / Panel background  */
  --bg-hover:       #e8eaed;   /* Hover / subtle emphasis  */

  --color-accent:         #4f6ef2;   /* Primary action color     */
  --color-accent-hover:   #3a57d4;   /* Hover state              */
  --color-accent-muted:   rgba(79, 110, 242, 0.12); /* Soft fill */

  --text-primary:   #1a1a2e;   /* Body / heading text      */
  --text-secondary: #5a5a7a;   /* Captions, labels         */
  --text-disabled:  #a0a0b8;   /* Disabled / placeholder   */

  --ds-border:         rgba(26, 26, 46, 0.10);
  --ds-border-strong:  rgba(26, 26, 46, 0.20);

  --shadow-sm: 0 1px 3px rgba(26,26,46,0.08);
  --shadow-md: 0 4px 16px rgba(26,26,46,0.10);
}
```

**Rules:**
- アクセントカラーはインタラクティブ要素専用
- 背景の重ね順: `bg-base` → `bg-surface` → `bg-hover`の順に浅から深
- テキストに純黒は不可。`text-primary` を使用

## 技術スタック

- **Front-end**: React 19 + TypeScript + Vite + Tailwind CSS v4 + shadcn/ui + npm

## ディレクトリ構成例

```
frontend/
├── node_modules/        # npmによる依存パッケージ置き場（git管理外）
├── public/              # アイコン画像、サイトマップなど静的ファイル
├── index.html           # ReactのDOMツリー生成起点
├── src/
│   ├── main.tsx         # アプリケーションのエントリポイント（原則触らない）
│   ├── App.tsx          # 各Pageのルーティング（URLとPageの対応）定義
│   ├── index.css        # グローバルCSSの定義（Tailwind読み込み、ベーススタイル定義）
│   ├── pages/           # ページコンポーネント（URLと1対1対応、薄く保つ）
│   │   ├── RootPage.tsx
│   │   └── SamplePage.tsx
│   ├── components/
│   │   ├── layout/      # アプリケーション全体の共通レイアウト
│   │   │   ├── AppLayout.tsx  # Header + Sidebar を束ねる最上位レイアウト
│   │   │   ├── Header.tsx
│   │   │   └── Sidebar.tsx
│   │   ├── feature/     # ロジック・状態・API通信を持つドメインコンポーネント
│   │   │   ├── wizard/
│   │   │   ├── notification/
│   │   │   └── error/
│   │   └── ui/          # shadcn/ui の配置先（状態・ロジックを持たない汎用UI部品）
│   ├── store/           # アプリ全体で共有する状態（Zustand）
│   │   └── wizardStore.ts
│   └── assets/          # 挿入する画像・動画リソース
└── 各種設定ファイル     # vite.config.ts, tsconfig.json, package.json 等
```

### ディレクトリ分割方針

| 場所 | 役割 | 判断基準 |
|------|------|----------|
| `pages/` | URLと1対1で対応するページコンポーネント | routerに登録するものはここ。ロジックは持たず薄く保つ |
| `components/layout/` | 全ページ共通のレイアウト骨格 | Header・Sidebar・AppLayoutのみ置く |
| `components/feature/` | ドメイン固有のロジック・状態・API通信 | 特定の機能に紐づくコンポーネントはすべてここ |
| `components/ui/` | 汎用UI部品（shadcn/ui含む） | 状態・ロジックを持たない純粋な見た目コンポーネント |
| `store/` | Zustandによるグローバル状態 | 複数コンポーネントをまたぐ共有状態のみ |
| `assets/` | 画像・動画リソース | importして使うリソース（public/はURLで直接参照するもの） |
