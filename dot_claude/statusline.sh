#!/bin/bash
# Claude Code statusline: model, dir, git branch, context and rate limits left
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // empty')
dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
ctx=$(echo "$input" | jq -r '.context_window.used_percentage // empty | 100 - .')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty | 100 - .')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty | 100 - .')

short="${dir/#$HOME/~}"

branch=""
if [ -n "$dir" ] && [ -d "$dir" ]; then
  branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" symbolic-ref --short HEAD 2>/dev/null \
    || GIT_OPTIONAL_LOCKS=0 git -C "$dir" rev-parse --short HEAD 2>/dev/null)
fi

out=""
add() { [ -n "$out" ] && out="$out | "; out="$out$1"; }

[ -n "$model" ] && add "$(printf '\033[36m%s\033[0m' "$model")"
[ -n "$short" ] && add "$(printf '\033[34m%s\033[0m' "$short")"
[ -n "$branch" ] && add "$(printf '\033[32m%s\033[0m' "$branch")"

left=""
[ -n "$ctx" ] && left="Context $(printf '%.0f' "$ctx")%"
[ -n "$five" ] && left="${left:+$left · }5h $(printf '%.0f' "$five")%"
[ -n "$week" ] && left="${left:+$left · }7d $(printf '%.0f' "$week")%"
[ -n "$left" ] && add "$left left"

printf '%s' "$out"
