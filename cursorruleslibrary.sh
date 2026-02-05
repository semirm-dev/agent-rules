#!/bin/bash
# Name: cursor-init.sh

LIBRARY_DIR="$HOME/.cursor-rules-library"
RULE_DIR=".cursor/rules"

# 1. Create central library
if [ ! -d "$LIBRARY_DIR" ]; then
    mkdir -p "$LIBRARY_DIR"
    echo "✅ Created central library at $LIBRARY_DIR"
fi

# 2. Create project structure
mkdir -p "$RULE_DIR"

# 3. Create Symlink
if [ -L "$RULE_DIR/global-rules" ]; then
    echo "ℹ️ Symlink already exists."
else
    ln -s "$LIBRARY_DIR" "$RULE_DIR/global-rules"
    echo "🔗 Symlinked global rules to project."
fi