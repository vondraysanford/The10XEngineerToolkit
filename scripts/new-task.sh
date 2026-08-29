#!/usr/bin/env bash
set -euo pipefail

# Scaffold a task folder from the Task-Template.
# Usage: scripts/new-task.sh <task-id> [target-parent-dir]
# Example: scripts/new-task.sh TASK-1234 ~/tasks

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <task-id> [target-parent-dir]" >&2
  exit 1
fi

ID="$1"
PARENT="${2:-.}"

KIT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$KIT_ROOT/workflows/task-lifecycle/Task-Template"
TARGET="$PARENT/$ID"

if [[ ! -d "$TEMPLATE" ]]; then
  echo "Template not found: $TEMPLATE" >&2
  exit 1
fi

if [[ -e "$TARGET" ]]; then
  echo "Refusing to overwrite: $TARGET" >&2
  exit 1
fi

mkdir -p "$PARENT"
cp -R "$TEMPLATE" "$TARGET"

echo "Created $TARGET"
echo "Next steps:"
echo "  1. Fill in DECISION.md before you write code."
echo "  2. Put deployment scripts in Scripts/ and paired undo scripts in Rollback/."
echo "  3. Complete the Definition of Done checklist before you close the item."
