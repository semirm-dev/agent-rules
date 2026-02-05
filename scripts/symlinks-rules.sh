#!/bin/bash
# 1. Source: Your master rule library
LIB_DIR="$HOME/workspace/agent-rules"

# 2. Automatically find the project root (the folder with the .git directory)
# If not in a git repo, it defaults to the current folder.
PROJ_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
TARGET_DIR="$PROJ_ROOT/.cursor/rules"

# 3. Create the project-specific rules folder
mkdir -p "$TARGET_DIR"

echo "🎯 Linking rules to project root: $PROJ_ROOT"

# 4. Link only .mdc files (avoiding .git, .sh, etc.)
shopt -s nullglob
for file in "$LIB_DIR"/*.mdc; do
    filename=$(basename "$file")
    # -sf forces the link and overwrites if it already exists
    ln -sf "$file" "$TARGET_DIR/$filename"
    echo "   ✅ Linked $filename -> $TARGET_DIR/"
done

echo "🚀 Project is now synced with your global AI DNA."