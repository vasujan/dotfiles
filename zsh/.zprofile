
# Greeting
echo "Welcome to Zsh, $USER!"
echo "$(date)"

# Default paths
export PATH="$HOME/bin:/usr/local/sbin:$PATH"

# Environment
export XDG_CONFIG_HOME="$HOME/.config/"

# Homebrew 
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# Pyenv 
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Applications 
eval "$(fzf --zsh)"
export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"

# Function to backup a directory
backup() {
    tar -czvf "$1_backup_$(date +%Y%m%d).tar.gz" "$1"
}

# Function to quickly search command history
hist_search() {
    history | grep "$1"
}

# Function to download a file and show progress
download() {
    curl -O "$1" --progress-bar
}

