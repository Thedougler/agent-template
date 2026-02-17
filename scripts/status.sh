#!/usr/bin/env bash
# Show status summary of all specs and tasks.
# Usage: ./scripts/status.sh [spec-number]
set -euo pipefail

FILTER="${1:-}"

print_status() {
  local file="$1"
  local status
  status=$(grep -m1 '^\*\*Status:\*\*' "$file" 2>/dev/null | sed 's/\*\*Status:\*\* *//' || echo "Unknown")
  printf "  %-45s %s\n" "$(basename "$file" .md)" "$status"
}

echo "=== SPECS ==="
for spec in specs/SPEC-[0-9]*.md; do
  [ -f "$spec" ] || continue
  if [ -n "$FILTER" ] && ! echo "$spec" | grep -q "SPEC-${FILTER}"; then
    continue
  fi
  print_status "$spec"

  # Show related tasks
  SPEC_NUM=$(echo "$spec" | sed 's/.*SPEC-\([0-9]*\).*/\1/')
  for task in tasks/TASK-${SPEC_NUM}-*.md; do
    [ -f "$task" ] || continue
    print_status "$task"
  done
  echo ""
done

# Summary counts
echo "=== SUMMARY ==="
TOTAL_SPECS=$(ls specs/SPEC-[0-9]*.md 2>/dev/null | wc -l | tr -d ' ')
TOTAL_TASKS=$(ls tasks/TASK-[0-9]*.md 2>/dev/null | wc -l | tr -d ' ')
DONE_TASKS=$(grep -l 'Done' tasks/TASK-[0-9]*.md 2>/dev/null | wc -l | tr -d ' ')
echo "Specs: $TOTAL_SPECS | Tasks: $TOTAL_TASKS (done: $DONE_TASKS)"
