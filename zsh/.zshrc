# .zshrc

# Environment 
export EDITOR=nvim

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## aliases
alias ll='ls -la'
alias gs='git status'
alias path="echo $PATH | tr ':' '\n'"
alias zso="source $ZDOTDIR/.zshrc"
alias zse="vim $ZDOTDIR/.zshrc"

## zsh history
HISTFILE=$HOME/.zsh_history
SAVHIST=1000
HISTSIZE=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey "^[[A" history-search-backward # up arrow
bindkey "^[[B" history-search-forward # down arrow
# Env
# export EDITOR='/usr/bin/vim'
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"


# tab completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

## colors
autoload -U colors && colors

## vcs
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# zstyle ':vcs_info:*' enable git svn
#zstyle ':vcs_info:git*' formats "(%b)"
# zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:git*' formats "(%b%c%u)"

# prompt
# setopt prompt_subst # allow substitution using %
# PS1=''
# PS1+='%B%F{14}%n%f%b ' # %n username
# PS1+='%F{6}%3~%f ' # %3 for dir depth=3
# PS1+='%F{40}${vcs_info_msg_0_}%f' # vcs 
# PS1+='
# %# ' # enter in new line
# RPROMPT=''

# Scripts
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# eval "$(fzf --zsh)"
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme 
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#compdef toggl
_toggl() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh  toggl)
}
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]]; then
  compdef _toggl toggl
fi

# yazi cwd
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
} 
