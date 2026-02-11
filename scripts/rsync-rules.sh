#!/bin/bash
# 1. Master Library Path
LIB_DIR="$HOME/workspace/agent-rules"

# 2. Check for folder argument
if [ -z "$1" ]; then
  echo "Usage: rsync-rules.sh <folder>"
  echo "  folder: cursor, claude, agents"
  echo ""
  echo "Examples:"
  echo "  rsync-rules.sh cursor   # Syncs cursor/ -> ~/.cursor/rules/"
  echo "  rsync-rules.sh claude   # Syncs claude/ -> ~/.claude/"
  echo "  rsync-rules.sh agents   # Syncs agents/ -> ~/.claude/agents/"
  exit 1
fi

FOLDER="$1"

# 3. Smart target mapping
case "$FOLDER" in
  cursor) TARGET_DIR="$HOME/.cursor/rules" ;;
  claude) TARGET_DIR="$HOME/.claude" ;;
  agents) TARGET_DIR="$HOME/.claude/agents" ;;
  *)
    echo "Unknown folder: $FOLDER"
    echo "Valid folders: cursor, claude, agents"
    exit 1
    ;;
esac

# 5. Create target directory
mkdir -p "$TARGET_DIR"

echo "🔄 Mirroring $FOLDER/ to: $TARGET_DIR"

# 6. Mirror all files
rsync -av "$LIB_DIR/$FOLDER/" "$TARGET_DIR/"

echo "🎉 Done. Rules are now physically mirrored (fixes Cursor indexing bugs)."
