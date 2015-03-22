#!/bin/bash

set -e

bold=`tput bold`
normal=`tput sgr0`

fancy_echo() {
  local fmt="$1"; shift
  printf "\xF0\x9F\x94\x91  $fmt\n" "$@"
}

run() {
  echo
  fancy_echo "Firing up the SSH agent. What's your name, agent?"
  eval "$(ssh-agent -s)"

  for ((n=1;n<=$count;n++)); do

    fancy_echo "Setting up key #$n"

    while true; do
      read -p "Please enter the email address you want to use: " email
      read -p "Is this correct? ${bold}$email${normal} (y/n) " yn
      case $yn in
        [Yy]* ) break;;
      esac
    done

    while true; do
      read -p "Please enter the filename you want to use: (id_rsa) " filename
      filename=${filename:-id_rsa}
      read -p "Is this correct? ${bold}$filename${normal} (y/n) " yn
      case $yn in
        [Yy]* ) break;;
      esac
    done

    ssh-keygen -t rsa -C $email -f ~/.ssh/$filename

    fancy_echo "Alright! Now, let's add it."
    ssh-add ~/.ssh/$filename

    pbcopy < ~/.ssh/$filename.pub
    fancy_echo "We've copied your public key to the clipboard."

    read -p "Would you like to open Github to set it up? (y/n) " yn
    case $yn in
      [Yy]* ) open -a safari https://github.com/settings/ssh && read -p "Hit enter to continue" yn;;
    esac

    read -p "Would you like to open Heroku to set it up? (y/n) " yn
    case $yn in
      [Yy]* ) open -a safari https://dashboard.heroku.com/account#ssh-keys && read -p "Hit enter to continue" yn;;
    esac

    echo "Don't worry, we cleared the clipboard!" | pbcopy
  done

  fancy_echo 'I feel safer already.'
}

read -p "How many SSH keys would you like to set up? " count
case $count in
  [0]) fancy_echo "LIAR!";;
  [1-9]) run;;
esac
