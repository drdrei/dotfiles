#!/bin/bash
set -euo pipefail

REPO="git@github.com:drdrei/dotfiles.git"

echo "=== Dotfiles Bootstrap ==="

# 1. Clone bare repo
if [ -d "$HOME/.dotfiles" ]; then
  echo "~/.dotfiles already exists, skipping clone"
else
  echo "Cloning dotfiles bare repo..."
  git clone --bare "${REPO}" "$HOME/.dotfiles"
fi

# 2. Create git alias
if git config --global --get alias.dotfiles >/dev/null 2>&1; then
  echo "Git alias 'dotfiles' already configured"
else
  echo "Creating git dotfiles alias..."
  git config --global alias.dotfiles '!git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
fi

# 3. Checkout dotfiles
if git dotfiles rev-parse --git-dir >/dev/null 2>&1; then
  echo "Checking out dotfiles..."
  git dotfiles checkout -f
fi

# 4. Hide untracked files
if [ "$(git dotfiles config --get status.showUntrackedFiles 2>/dev/null)" != "no" ]; then
  echo "Hiding untracked files in status..."
  git dotfiles config status.showUntrackedFiles no
fi

echo "=== Done ==="
echo "Manage with: git dotfiles add/commit/push"
