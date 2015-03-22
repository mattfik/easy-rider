#!/bin/sh

set -e

fancy_echo() {
  local fmt="$1"; shift
  printf "\xF0\x9F\x90\x9D  $fmt\n" "$@"
}

would_you_kindly() {
  read -p "Setup $1? (y/n) " yn
  case $yn in
    [Yy]* ) bash setup-$1.sh;;
  esac
}

setup() {
  cd ${0%/*}

  fancy_echo "Ok. Let's begin."

  would_you_kindly brew
  # would_you_kindly ruby
  # would_you_kindly ssh
  would_you_kindly dotfiles
  # would_you_kindly fonts
  would_you_kindly defaults

  fancy_echo "Setup complete!"
}


read -p "Are you ready? (y/n) " yn
case $yn in
  [Yy]* ) setup;;
  * ) fancy_echo "Coward.";;
esac
