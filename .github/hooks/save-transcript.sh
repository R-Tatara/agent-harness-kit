#!/usr/bin/env bash
# save-transcript.sh
# セッションのトランスクリプトを .github/logs/raw/{YYYYMMDD}.md に自動で追記する。
# Stop / SessionEnd フックから呼ばれる前提。要約・判断は一切せず、追記だけを行う。
# 既に保存した分はオフセット管理で二重に保存しない。
# 何があってもセッションを止めないよう、常に exit 0 で終わる。

set -u

input="$(cat)"

# フック入力 JSON から transcript_path を取り出す（jq が無くても動くよう grep で拾う）
transcript="$(printf '%s' "$input" | grep -o '"transcript_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -n 1 | sed 's/^.*"transcript_path"[[:space:]]*:[[:space:]]*"//; s/"$//')"
[ -n "$transcript" ] && [ -f "$transcript" ] || exit 0

project_dir="${CLAUDE_PROJECT_DIR:-$PWD}"
raw_dir="$project_dir/.github/logs/raw"
mkdir -p "$raw_dir" 2>/dev/null || exit 0

# 保存済みオフセット（バイト数）をトランスクリプトごとに保持する
offset_file="$raw_dir/.offset-$(printf '%s' "$transcript" | tr '/.' '__')"
saved=0
if [ -f "$offset_file" ]; then
  saved="$(cat "$offset_file" 2>/dev/null || echo 0)"
  case "$saved" in ''|*[!0-9]*) saved=0 ;; esac
fi

size="$(wc -c < "$transcript" | tr -d ' ')"
# トランスクリプトが作り直されて小さくなっていたら、最初から保存し直す
if [ "$size" -lt "$saved" ]; then
  saved=0
fi
[ "$size" -gt "$saved" ] || exit 0

out="$raw_dir/$(date +%Y%m%d).md"
{
  printf '\n## session %s\n\n' "$(date '+%Y-%m-%dT%H:%M:%S%z')"
  printf 'transcript: %s\n\n' "$transcript"
  tail -c "+$((saved + 1))" "$transcript"
  printf '\n'
} >> "$out" 2>/dev/null || exit 0

printf '%s' "$size" > "$offset_file" 2>/dev/null || true
exit 0
