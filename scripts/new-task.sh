#!/usr/bin/env bash
# Create a new task from TASK_TEMPLATE.md linked to a spec.
# Usage: ./scripts/new-task.sh <spec-number> <short-description>
# Example: ./scripts/new-task.sh 001 setup-auth-database
set -euo pipefail

SPEC="${1:?Usage: $0 <spec-number> <short-description>}"
DESC="${2:?Usage: $0 <spec-number> <short-description>}"
DESC=$(echo "$DESC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')

# Validate spec exists
SPEC_FILE=$(ls specs/SPEC-${SPEC}-*.md 2>/dev/null | head -1)
if [ -z "$SPEC_FILE" ]; then
  echo "Error: No spec found matching SPEC-${SPEC}" >&2
  exit 1
fi

# Find next task sequence for this spec
LAST=$(ls tasks/TASK-${SPEC}-*.md 2>/dev/null | sed "s/.*TASK-${SPEC}-\([0-9]*\).*/\1/" | sort -n | tail -1)
SEQ=$(( ${LAST:-0} + 1 ))

TARGET="tasks/TASK-${SPEC}-${SEQ}-${DESC}.md"

if [ -f "$TARGET" ]; then
  echo "Error: $TARGET already exists" >&2
  exit 1
fi

sed \
  -e "s/# Task Template/# TASK-${SPEC}-${SEQ}: ${DESC}/" \
  -e "s|<!-- Link to the spec this task implements -->|[SPEC-${SPEC}](../${SPEC_FILE})|" \
  -e "s|<!-- Unique identifier for this task -->|TASK-${SPEC}-${SEQ}|" \
  tasks/TASK_TEMPLATE.md > "$TARGET"

echo "Created $TARGET (linked to $SPEC_FILE)"
