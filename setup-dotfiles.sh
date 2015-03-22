#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift
  printf "$fmt\n" "$@"
}

fancy_echo "Cloning dotfiles..."
git clone git@github.com:mattfik/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash bootstrap.sh
