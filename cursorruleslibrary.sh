#!/bin/bash
# Name: cursorruleslibrary.sh

# Use an absolute path for the library to help Cursor's indexer
LIBRARY_DIR="$HOME/workspace/agent-rules"
RULE_DIR=".cursor/rules"

# 1. Create central library
if [ ! -d "$LIBRARY_DIR" ]; then
    mkdir -p "$LIBRARY_DIR"
    echo "✅ Created central library at $LIBRARY_DIR"
fi

# 2. Create project structure
mkdir -p "$RULE_DIR"

# 3. Create Symlink (using absolute path for the target)
# We use the full path to $LIBRARY_DIR to ensure the IDE doesn't get lost
if [ -L "$RULE_DIR/global-rules" ]; then
    echo "ℹ️ Symlink already exists."
else
    # Use -f to overwrite if a broken link exists
    ln -sf "$LIBRARY_DIR" "$RULE_DIR/global-rules"
    echo "🔗 Symlinked global rules to project: $RULE_DIR/global-rules -> $LIBRARY_DIR"
fi