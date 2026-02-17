#!/usr/bin/env bash
# Update the status of a spec or task file.
# Usage: ./scripts/set-status.sh <file> <new-status>
# Example: ./scripts/set-status.sh specs/SPEC-001-example-calculator.md "In Progress"
#          ./scripts/set-status.sh tasks/TASK-001-1-create-calculator-structure.md "Done"
set -euo pipefail

FILE="${1:?Usage: $0 <file> <new-status>}"
STATUS="${2:?Usage: $0 <file> <new-status>}"

if [ ! -f "$FILE" ]; then
  echo "Error: $FILE not found" >&2
  exit 1
fi

# Replace the status line (handles optional emoji/checkmark suffix)
if grep -q '^\*\*Status:\*\*' "$FILE"; then
  sed -i '' "s/^\*\*Status:\*\*.*/\*\*Status:\*\* ${STATUS}/" "$FILE"
  echo "Updated $(basename "$FILE") → $STATUS"
else
  echo "Error: No **Status:** line found in $FILE" >&2
  exit 1
fi
