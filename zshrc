# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Load pythonz
[[ -s "$HOME/.pythonz/etc/bashrc" ]] && source "$HOME/.pythonz/etc/bashrc"

# Load tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Aliases
alias g="git"
alias v="Vim"
alias t="tmux"
alias c="cd"
alias be="bundle exec"
