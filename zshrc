# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"

# Set the terminal variable.
export TERM="xterm-color"

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="Soliah"

# Set GNU LS_COLORS
export LS_COLORS=`cat ~/.lscolors`

# Set the following to your favourite editor.
export EDITOR="vim"

# Run oh-my-zsh.
plugins=(rails git brew ruby osx gem bundler rvm)
source $ZSH/oh-my-zsh.sh

# Set my PATH.
export PATH="/Users/Soliah/Coding/scripts:/usr/local/Cellar/python/2.7.1/bin:$PATH"

# Set node PATH.
export NODE_PATH="/usr/local/lib/node"

# Run RVM.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
unsetopt auto_name_dirs

# Aliases
alias ls="gls --color=auto" # Use GNU ls
alias l="ls"
alias rm="rm"
alias mv="mv -i"
alias cp="cp -i"
alias ll="ls -lh"
alias la="ls -A"
alias lll="ls -lhA"
alias vi="vim"
alias tmux="tmux -uf $HOME/.tmux.conf"
alias t="tmux"
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# Keybinds - OSX
bindkey -v
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
