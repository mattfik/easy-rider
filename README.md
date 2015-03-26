# Easy Rider
The main `setup.sh` script runs the other setup scripts.

1. Homebrew
  * Install Homebrew, if necessary, then...
  * `brew update`
  * `brew install git`
  * `brew install rbenv`
2. Ruby
  * Install the latest version and setup rbenv, if necessary, then...
  * `gem update --system`
  * `gem install bundler`
  * `gem install rspec`
  * `rbenv rehash`
3. SSH
  * Prompts you for how many SSH keys you'd like to setup
  * Commence wizardry
4. Dotfiles
  * Automates the process of setting up [my dotfiles](https://github.com/mattfik/dotfiles).
5. Fonts
  * Source Code Pro
6. OSX Defaults
  * Decent OSX defaults. Inspired by [Mathias](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).
