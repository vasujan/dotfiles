
# Environment Variables
export LANG=en_US.UTF-8
export EDITOR="/usr/bin/vim"
export ZDOTDIR="$HOME/.config/zsh/"
export HOMEBREW_PREFIX="/opt/homebrew"
export PYENV_ROOT="$HOME/.pyenv"

# Set default shell options
setopt no_beep      # Disable terminal bell
setopt no_clobber   # Prevent overwriting of files with redirection
setopt hist_ignore_all_dups # Ignore duplicate history entries
setopt inc_append_history # Add commands to history immediately

# Export less options for better readability
export LESS="-R -M --shift 5"

# Automatically correct minor command typos
setopt correct_all

# Share history between all sessions
setopt share_history





