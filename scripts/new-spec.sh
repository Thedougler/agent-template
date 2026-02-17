#!/usr/bin/env bash
# Create a new spec from SPEC_TEMPLATE.md with auto-incremented number.
# Usage: ./scripts/new-spec.sh <short-description>
# Example: ./scripts/new-spec.sh user-authentication
set -euo pipefail

DESC="${1:?Usage: $0 <short-description>}"
DESC=$(echo "$DESC" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')

# Find next spec number
LAST=$(ls specs/SPEC-*.md 2>/dev/null | sed 's/.*SPEC-\([0-9]*\).*/\1/' | sort -n | tail -1)
NEXT=$(printf "%03d" $(( ${LAST:-0} + 1 )))

TARGET="specs/SPEC-${NEXT}-${DESC}.md"

if [ -f "$TARGET" ]; then
  echo "Error: $TARGET already exists" >&2
  exit 1
fi

sed "s/# SPEC Template/# SPEC-${NEXT}: ${DESC}/" specs/SPEC_TEMPLATE.md > "$TARGET"
echo "Created $TARGET"
