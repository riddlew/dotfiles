#!/usr/bin/env bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "unknown"')
project_dir=$(echo "$input" | jq -r '.workspace.project_dir // .workspace.current_dir // "unknown"')
git_worktree=$(echo "$input" | jq -r '.workspace.git_worktree // empty')
worktree_branch=$(echo "$input" | jq -r '.worktree.branch // empty')

# Git branch from project_dir
git_branch=""
if [ -n "$project_dir" ] && [ "$project_dir" != "unknown" ]; then
  git_branch=$(git -C "$project_dir" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
fi

# Estimated cost (input ~$3/MTok, output ~$15/MTok for Sonnet models; use generic approximation)
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
# Sonnet 4 pricing: input $3/MTok, output $15/MTok
cost=$(echo "$total_input $total_output" | awk '{printf "%.4f", ($1 * 3 + $2 * 15) / 1000000}')

# Context window usage percentage
ctx_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Rate limits
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Format reset times as time remaining until reset
time_until_reset() {
  local epoch="$1"
  if [ -n "$epoch" ] && [ "$epoch" != "null" ]; then
    local now
    now=$(date +%s)
    local diff=$(( epoch - now ))
    if [ "$diff" -le 0 ]; then
      echo "now"
    else
      local h=$(( diff / 3600 ))
      local m=$(( (diff % 3600) / 60 ))
      if [ "$h" -gt 0 ]; then
        printf '%dh%02dm' "$h" "$m"
      else
        printf '%dm' "$m"
      fi
    fi
  fi
}

five_reset_fmt=$(time_until_reset "$five_reset")
week_reset_fmt=$(time_until_reset "$week_reset")

# Build line 1: model, project dir, git info
line1_parts=()

line1_parts+=("$(printf '\033[0;36m%s\033[0m' "$model")")

# Project dir (basename for brevity)
proj_base=$(basename "$project_dir")
line1_parts+=("$(printf '\033[0;33mdir:\033[0m %s' "$proj_base")")

# Git info
git_info=""
if [ -n "$git_branch" ]; then
  git_info="$git_branch"
fi
if [ -n "$git_worktree" ]; then
  git_info="$git_info${git_info:+ }(wt:$git_worktree)"
elif [ -n "$worktree_branch" ]; then
  git_info="$git_info${git_info:+ }(wt:$worktree_branch)"
fi
if [ -n "$git_info" ]; then
  line1_parts+=("$(printf '\033[0;32mbranch:\033[0m %s' "$git_info")")
fi

# Build line 2: cost, context usage, rate limits
line2_parts=()

# Cost
line2_parts+=("$(printf '\033[0;35mest. cost:\033[0m $%s' "$cost")")

# Context usage
if [ -n "$ctx_used" ]; then
  line2_parts+=("$(printf '\033[0;34mcontext:\033[0m %.0f%%' "$ctx_used")")
fi

# Rate limits
if [ -n "$five_pct" ]; then
  five_str="$(printf '5h: %.0f%%' "$five_pct")"
  [ -n "$five_reset_fmt" ] && five_str="$five_str (reset in $five_reset_fmt)"
  line2_parts+=("$(printf '\033[0;31m%s\033[0m' "$five_str")")
fi

if [ -n "$week_pct" ]; then
  week_str="$(printf '7d: %.0f%%' "$week_pct")"
  [ -n "$week_reset_fmt" ] && week_str="$week_str (reset in $week_reset_fmt)"
  line2_parts+=("$(printf '\033[0;31m%s\033[0m' "$week_str")")
fi

# Join parts within each line with separator
join_parts() {
  local result=""
  for part in "$@"; do
    if [ -z "$result" ]; then
      result="$part"
    else
      result="$result  |  $part"
    fi
  done
  printf '%s' "$result"
}

line1=$(join_parts "${line1_parts[@]}")
line2=$(join_parts "${line2_parts[@]}")

printf '%s\n%s' "$line1" "$line2"
