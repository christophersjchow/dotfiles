# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Load pythonz
[[ -s "$HOME/.pythonz/etc/bashrc" ]] && source "$HOME/.pythonz/etc/bashrc"

# Aliases
alias g="git"
alias c="cd"
alias be="bundle exec"
