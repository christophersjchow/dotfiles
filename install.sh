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
  tinted-theming
)

for file in "${main_dotfiles[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.$file"
done

for file in "${xdg_config[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.config/$file"
done
