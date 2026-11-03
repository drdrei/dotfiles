# Shell functions shared by every host, sourced from ~/.zshrc and /etc/profile.d.

# Attach to the pi box's tmux session.
pilocal() {
	command ssh -t local-ai "tmux new -A -s pi"
}
