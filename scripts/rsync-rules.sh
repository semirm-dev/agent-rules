#!/bin/bash
# 1. Master Library Path
LIB_DIR="$HOME/workspace/agent-rules"

# 2. Find the project root
PROJ_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
TARGET_DIR="$PROJ_ROOT/.cursor/rules"

# 3. Create target directory
mkdir -p "$TARGET_DIR"

echo "🔄 Mirroring MDC rules to: $TARGET_DIR"

# 4. Mirror only .mdc files and delete orphans
rsync -av --delete \
      --include="*.mdc" \
      --exclude="*" \
      "$LIB_DIR/" "$TARGET_DIR/"

echo "🎉 Done. Rules are now physically mirrored (fixes Cursor indexing bugs)."