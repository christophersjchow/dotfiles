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
  nvim
  tmux.conf
  sqliterc
  screenrc
  pryrc
  lscolors
  lftp
  hushlogin
  gitexclude
  gemrc
  asdfrc
)

declare -a xdg_config
xdg_config=(
  nvim
  tinted-theming
)

for file in "${main_dotfiles[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.$file"
done

for file in "${xdg_config[@]}"; do
  ln -nfs "$ROOT/$file" "$HOME/.config/$file"
done
