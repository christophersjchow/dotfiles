#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Set the following to your favourite editor.
export EDITOR="vim"

# Set my PATH.
export PATH="$HOME/Coding/scripts:/usr/local/Cellar/python/2.7.1/bin:$PATH"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Load pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# Set node PATH.
export NODE_PATH="/usr/local/lib/node"

alias g="git"
alias c="cd"
alias pvm="pythonbrew"
alias be="bundle exec"
