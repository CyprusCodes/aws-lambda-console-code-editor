#!/bin/bash

VSCODE_VERSION="1.88.0"

# Set current project root
PROJ_ROOT=$(pwd)

echo "Fetching and building VS Code source..."

# Fetch and build VS Code source if necessary
cd "$( dirname "${BASH_SOURCE[0]}" )/.."
if [ ! -d "vscode" ]; then
  echo "Cloning VS Code repository..."
  git clone --depth 1 https://github.com/microsoft/vscode.git -b "$VSCODE_VERSION"
fi
cd "vscode"

if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  yarn
fi

# Apply patches
echo "Applying patches..."
git checkout -- .
for patch in ../patches/*; do
  echo "Applying patch: $patch"
  if ! git apply "$patch"; then
    echo "Error applying patch: $patch"
    exit 1
  fi
done

# Print the list of changed files after all patches have been applied
echo "Files changed by patches:"
git diff --name-only

echo "Done!"