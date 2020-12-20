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

# Load nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# Setup docker environment variables docker-machine
# if which docker-machine > /dev/null; then
#   eval "$(docker-machine env dev)";
# fi

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
