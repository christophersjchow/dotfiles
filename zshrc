#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Preserve an agent forwarded into an SSH session; otherwise use 1Password.
onepassword_agent="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
if [[ -z ${SSH_CONNECTION:-} || -z ${SSH_AUTH_SOCK:-} || ! -S ${SSH_AUTH_SOCK} ]]; then
  export SSH_AUTH_SOCK="$onepassword_agent"
fi
unset onepassword_agent

# Skip automatic Git commit and tag signing in SSH sessions.
if [[ -n ${SSH_CONNECTION:-} ]]; then
  export GIT_CONFIG_COUNT=2
  export GIT_CONFIG_KEY_0=commit.gpgsign
  export GIT_CONFIG_VALUE_0=false
  export GIT_CONFIG_KEY_1=tag.gpgsign
  export GIT_CONFIG_VALUE_1=false
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Tinty isn't able to apply environment variables to your shell due to
# the way shell sub-processes work. This is a work around by running
# Tinty through a function and then executing the shell scripts.
tinty_source_shell_theme() {
  newer_file=$(mktemp)
  tinty $@
  subcommand="$1"

  if [ "$subcommand" = "apply" ] || [ "$subcommand" = "init" ]; then
    tinty_data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/tinted-theming/tinty"

    while read -r script; do
      # shellcheck disable=SC1090
      . "$script"
    done < <(find "$tinty_data_dir" -maxdepth 1 -type f -name "*.sh" -newer "$newer_file")

    unset tinty_data_dir
  fi

  unset subcommand
}

if [ -n "$(command -v 'tinty')" ]; then
  tinty_source_shell_theme "init" > /dev/null
  alias tinty=tinty_source_shell_theme
fi

# Load direnv
if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

# Load mise and its shell completions
if which mise > /dev/null; then
  eval "$(mise activate zsh)"
  source <(mise completion zsh)
fi

# Google Cloud SDK
if (( $+commands[brew] )); then
  export USE_GKE_GCLOUD_AUTH_PLUGIN=True
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

  # Load homebrew completions
  fpath=($fpath $HOMEBREW_PREFIX/share/zsh/site-functions)
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
alias tf='tofu'
alias k='kubectl'
alias kx='kubectx'
