#!/bin/bash -eu

function configure_git() {
  if [ ! -f "$(pwd)/git-completion.bash" ]; then
    echo 'Downloading git completions for bash'
    curl -sSO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  fi

  if [ ! -f "$(pwd)/git-prompt.sh" ]; then
    echo 'Downloading git script for shell prompt'
    curl -sSO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  fi

  # TODO - include this repo's gitconfig in system .gitconfig so that we can override it with OS/machine specific config
  echo 'Replacing existing .gitconfig configuration with symlink'
  rm -f "$HOME/.gitconfig"
  ln -s "$(pwd)/gitconfig" "$HOME/.gitconfig"
}

function configure_neovim() {
  if [ ! -d "$(pwd)/nvim/bundle/Vundle.vim" ]; then
    echo 'Cloning vim plugin manager (Vundle)'
    mkdir -p "$(pwd)/nvim/bundle/"
    git clone https://github.com/VundleVim/Vundle.vim.git "$(pwd)/nvim/bundle/Vundle.vim"
  fi

  echo 'Replacing existing neovim configuration with symlink'
  rm -rf "$HOME/.config/nvim"
  ln -s "$(pwd)/nvim" "$HOME/.config/nvim"
}

function setup_mac_os() {
  echo 'Setting Mac OS environment'

  configure_git
  configure_neovim

  echo 'Ensuring the profile file in this directory is always sourced in .profile'
  SOURCE_PROFILE="source $(pwd)/profile"
  grep -q "$SOURCE_PROFILE" "$HOME/.profile" || echo "$SOURCE_PROFILE" >> "$HOME/.profile"

  if [ ! -d "$HOME/base16-iterm2" ]; then
    echo 'Cloning base16 color scheme for iterm2'
    git clone https://github.com/chriskempson/base16-iterm2.git ~/base16-iterm2
  fi

  if [ ! -d "$HOME/powerline-fonts" ]; then
    echo 'Cloning special fonts for use with Neovim airline plugin'
    git clone https://github.com/powerline/fonts.git "$HOME/powerline-fonts"
    "$HOME/powerline-fonts/install.sh"
  fi
}

function setup_linux() {
  echo 'Setting up linux environment'

  configure_git
  configure_neovim

  echo 'Ensuring the profile file in this directory is always sourced in .bashrc'
  SOURCE_PROFILE="source $(pwd)/profile"
  grep -q "$SOURCE_PROFILE" "$HOME/.bashrc" || echo "$SOURCE_PROFILE" >> "$HOME/.bashrc"
}

function main() {
  case $(uname -o) in
    'GNU/Linux')
      setup_linux
      ;;
    *)
      setup_mac_os
  esac
}

main
