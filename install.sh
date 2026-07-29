#!/bin/bash

ROOT=$(pwd)

declare -a main_dotfiles
main_dotfiles=(
  zlogin
  zprofile
  zshenv
  zshrc
  zprezto
  zpreztorc
  gemrc
  gitexclude
  hushlogin
  lftp
  lscolors
  npmrc
  nvim
  pryrc
  screenrc
  sqliterc
  tmux.conf
)

declare -a xdg_config
xdg_config=(
  mise
  nvim
  ssh-agent
  tinted-theming
)

for file in "${main_dotfiles[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.$file"
done

for file in "${xdg_config[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.config/$file"
done

mkdir -p "$HOME/.config/herdr"
ln -nfs "$ROOT/herdr/config.toml" "$HOME/.config/herdr/config.toml"

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
ln -nfs "$ROOT/ssh-agent/rc" "$HOME/.ssh/rc"
