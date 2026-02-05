#!/bin/bash
# Name: cursor-link-rules.sh

LIBRARY_DIR="$HOME/workspace/agent-rules"
RULE_DIR=".cursor/rules"

# 1. Ensure project structure exists
mkdir -p "$RULE_DIR"

# 2. Check if library exists
if [ ! -d "$LIBRARY_DIR" ]; then
    echo "❌ Error: Library not found at $LIBRARY_DIR"
    exit 1
fi

# 3. Create individual symlinks for each .mdc file
echo "🔗 Linking rules from $LIBRARY_DIR..."
for file in "$LIBRARY_DIR"/*.mdc; do
    filename=$(basename "$file")
    # -s for symbolic, -f to overwrite existing links
    ln -sf "$file" "$RULE_DIR/$filename"
    echo "   ✅ Linked $filename"
done

echo "🎉 Done! Restart Cursor to force a re-index."