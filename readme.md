# Dotfiles

Personal configuration files and tools.

## Installation

### Quick Setup (Bare Repository)

For a clean home directory without a `dotfiles/` working tree, use a bare repository:

```bash
# Clone as bare repo
git clone --bare git@github.com:drdrei/dotfiles.git ~/.dotfiles

# Create git alias for managing dotfiles
git config --global alias.dotfiles '!git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Checkout all dotfiles into home directory
git dotfiles checkout

# Set flag to hide untracked files in home directory
git dotfiles config status.showUntrackedFiles no
```

Files will be checked out directly to `~`. Manage with `git dotfiles add`, `git dotfiles commit`, etc.

### One-Line Bootstrap

Automates the bare repo setup above:

```bash
curl https://raw.githubusercontent.com/drdrei/dotfiles/main/.config/scripts/pi-bootstrap.sh | bash
```

### Alternative: Standard Clone

If you prefer a standard clone:

```bash
git clone git@github.com:drdrei/dotfiles.git ~/dotfiles
```

Then manage files from `~/dotfiles/` or selectively symlink configs.

## Notes

- **Bare repo recommended** — Keeps home directory clean. Use `git dotfiles` alias for all git operations.
- To prevent git from tracking all home directory files, the bare repo uses `status.showUntrackedFiles no`.

## Directory Structure

### `.config/` — Application Configs

| File | Description |
|------|-------------|
| `config/iterm2/iterm2-profile.json` | iTerm2 profile (colors, font, keybindings) |
| `config/tmux/tmux.conf` | Tmux config (prefix C-Space, plugins, pane layout) |
| `config/zsh/git.sh` | Zsh helpers and git dotfiles aliases |
| `config/scripts/` | Bootstrap and utility scripts |

### `.config/nvim/` — Neovim (LazyVim)

LazyVim distribution — installed locally but not tracked in the dotfiles repo.

### `.backup/` — Shell Configs

Shell configs kept here instead of the home directory root:

| File | Description |
|------|-------------|
| `.backup/.bashrc` | Bash config — sources `~/.profile` |
| `.backup/.profile` | Common aliases, NVM, cargo, kasa, ssh tunnel |
| `.backup/.zshrc` | Zsh config — sources profile, loads NVM and bun |

### `.pi/` — Pi Coding Agent Configuration

The Pi coding agent is set up for local LLM + GitHub Copilot integration.

| File | Description |
|------|-------------|
| `.pi/agent/settings.json` | Pi agent settings: default model (`qwen3.6-35b-mtp`), enabled models, theme, compaction, thinking levels, and package list |
| `.pi/agent/local-models.json` | Per-model overrides for local LLMs (Ollama/vLLM): URL, context windows, reasoning flags, and sampling params for `qwen3.8-27b` and `qwen3.6-35b-mtp` |
| `.pi/agent/extensions/local-models.ts` | Pi extension that discovers and configures local models from `local-models.json`, merging per-model overrides with defaults |

### `.gitignore`

Ignores `.pi/agent/auth.json` — live auth tokens that should not be committed.

### `LICENSE`

MIT No Attribution — use, modify, and distribute freely without warranty.
