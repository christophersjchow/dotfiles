# dotfiles

These are my dotfiles I've used in some form over the last 10+ years.

## Prerequisites

- [iTerm2](http://www.iterm2.com/)
- [homebrew](http://brew.sh/)

## Setup

- Install [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) tap and run `brew bundle` to install packages required
- After all packages are installed, change your login shell to the homebrew installed version of zsh `/usr/local/bin/zsh`

### Base16/24 Colours

I use the [tinty](https://github.com/tinted-theming/tinty) to set the themes across the shell, tmux and neovim.

If you wish to use a different colour, just run `tinty apply THEME` and this will persist across shell sessions.
