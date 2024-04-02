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

# Load base16-shell
export BASE16_THEME="tomorrow-night"
export BASE16_FZF_PATH="$HOME/.colours/base16-fzf"
BASE16_SHELL_PATH="$HOME/.colours/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Load asdf
if which brew > /dev/null; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
else
  if [[ -s "$HOME/.asdf/asdf.sh" ]]; then
    . $HOME/.asdf/asdf.sh
  fi
fi

# Shellfish app onfig
test -e "$HOME/.shellfishrc" && source "$HOME/.shellfishrc"

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
