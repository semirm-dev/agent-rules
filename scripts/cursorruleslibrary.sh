#!/bin/bash
# 1. Source: Your master rule library
LIB_DIR="$HOME/workspace/agent-rules"

# 2. Destination: The global User Rules folder
TARGET_DIR="$HOME/.cursor/rules"

# 3. Create target if it doesn't exist
mkdir -p "$TARGET_DIR"

# 4. Link only .mdc files
echo "🔗 Linking .mdc files to $TARGET_DIR..."

shopt -s nullglob
for file in "$LIB_DIR"/*.mdc; do
    filename=$(basename "$file")
    # Force symbolic link (-s for symlink, -f to overwrite)
    ln -sf "$file" "$TARGET_DIR/$filename"
    echo "   ✅ Linked $filename"
done

echo "🎉 Done. Rules are now globally linked to ~/.cursor/rules/"