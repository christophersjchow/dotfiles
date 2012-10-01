# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

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
