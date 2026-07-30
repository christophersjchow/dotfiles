#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Route persistent tmux and Herdr shells through a stable socket so they survive
# SSH reconnects. Fresh remote shells select their forwarded agent; fresh local
# shells select 1Password. Shells already using the stable socket preserve the
# selection made by the outer client instead of switching it underneath Herdr.
ssh_agent_refresh="${XDG_CONFIG_HOME:-$HOME/.config}/ssh-agent/refresh"
ssh_agent_stable="$HOME/.ssh/agent/current"
onepassword_agent="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
ssh_agent_source=

if [[ ${SSH_AUTH_SOCK:-} == $ssh_agent_stable && -S $ssh_agent_stable ]]; then
  # A persistent pane already uses the indirection. Do not overwrite the
  # source selected by the shell that attached the current client.
  :
elif [[ -n ${SSH_CONNECTION:-} && -n ${SSH_AUTH_SOCK:-} && -S ${SSH_AUTH_SOCK} ]]; then
  ssh_agent_source=$SSH_AUTH_SOCK
elif [[ -z ${SSH_CONNECTION:-} && -S $onepassword_agent ]]; then
  ssh_agent_source=$onepassword_agent
fi

if [[ -n $ssh_agent_source && -x $ssh_agent_refresh && -S $ssh_agent_source ]]; then
  export SSH_AGENT_SOURCE_SOCK=$ssh_agent_source
  if refreshed_agent=$($ssh_agent_refresh "$ssh_agent_source"); then
    export SSH_AUTH_SOCK=$refreshed_agent
  fi
elif [[ -z ${SSH_CONNECTION:-} && ( -z ${SSH_AUTH_SOCK:-} || ! -S ${SSH_AUTH_SOCK} ) ]]; then
  export SSH_AUTH_SOCK=$onepassword_agent
fi

unset onepassword_agent refreshed_agent ssh_agent_refresh ssh_agent_source ssh_agent_stable

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

# ShellFish appends LC_TERMINAL every time it is sourced. Keep tmux's attach
# environment canonical and include the original agent used by local clients.
if [[ -n ${TMUX:-} ]]; then
  tmux set-option -g update-environment \
    'DISPLAY KRB5CCNAME MSYSTEM SSH_ASKPASS SSH_AUTH_SOCK SSH_AGENT_PID SSH_AGENT_SOURCE_SOCK SSH_CONNECTION WINDOWID XAUTHORITY LC_TERMINAL'
fi

alias agent-status='${XDG_CONFIG_HOME:-$HOME/.config}/ssh-agent/refresh --status'

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
alias ls='ls --color=auto'
# Support terminals that send either normal or application cursor sequences.
for keymap in emacs viins; do
  bindkey -M "$keymap" '^[[A' history-substring-search-up
  bindkey -M "$keymap" '^[OA' history-substring-search-up
  bindkey -M "$keymap" '^[[B' history-substring-search-down
  bindkey -M "$keymap" '^[OB' history-substring-search-down
done
unset keymap
