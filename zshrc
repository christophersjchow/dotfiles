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

# Source base16 256 colourspace script.
if [[ -s "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh" ]]; then
  source "$HOME/.colours/base16-shell/scripts/base16-tomorrow-night.sh"
fi

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Load asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias a='tmux attach -t'
alias g='git'
alias v='nvim'
alias vim='nvim'
alias n='nvim'
alias t='tmux'
alias c='cd'
alias s='spring'
alias be='bundle exec'
alias gt='go test -v -cover $(go list ./... | grep -v vendor)'
alias mux='tmuxinator'
alias tf='terraform'
alias k='kubectl'
alias kx='kubectx'
