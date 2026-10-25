# Dotfiles helpers (sourced from ~/.profile)
# Usage: source ~/.config/zsh/git.sh

# Open the dotfiles repo in nvim (for editing tracked dotfiles)
alias do:nv='GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim'

# Show untracked files in home directory
alias do:config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no'

# Set local git identity for dotfiles repo
alias do:local='git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local user.name "DrDrei" && git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local user.email "9737270+DrDrei@users.noreply.github.com"'
