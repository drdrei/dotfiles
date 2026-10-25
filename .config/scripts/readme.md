## Scripts

### Bootstraps

- **`bootstrap-mac`** — Installs Homebrew, CLI tools (neovim, tmux, node, ripgrep, fd), and casks (brave, signal, iterm2, hack nerd font, obsidian)
- **`bootstrap-debian`** — System updates, firewall (ufw), Docker installation
- **`bootstrap-proxmox`** — Proxmox VE setup: source config, LVM resize, system updates

```bash
# Run from GitHub
bash -c "$(curl -fsSL https://raw.githubusercontent.com/drdrei/dotfiles/main/.config/scripts/bootstrap-mac)"
```

### Utilities

- **`pi-bootstrap.sh`** — One-line bootstrap for the dotfiles bare repo setup
- **`display-placer`** — Interactive multi-monitor layout tool (home/quit profiles)
- **`setup-bare-fugitive`** — Configures fugitive.vim for bare dotfiles repos

### Docker

```bash
# Check container sizes
docker ps -a --size --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Size}}"
```

### Bootable ISOs (macOS)

```bash
diskutil list; df -Hl
dd bs=1M if=iso of=/dev/your_usb status=progress
```
