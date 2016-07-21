#!/bin/bash -eu

if [ ! -f "$(pwd)/git-completion.bash" ]; then
	echo 'Downloading git completions for bash'
	curl -sSO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

if [ ! -f "$(pwd)/git-prompt.sh" ]; then
	echo 'Downloading git script for shell prompt'
	curl -sSO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi

echo 'Ensuring the profile file in this directory is always sourced in .profile'
SOURCE_PROFILE="source $(pwd)/profile"
grep -q "$SOURCE_PROFILE" "$HOME/.profile" || echo "$SOURCE_PROFILE" >> "$HOME/.profile"

echo 'Symlink git configuration'
rm -f "$HOME/.gitconfig"
ln -s "$(pwd)/gitconfig" "$HOME/.gitconfig"

if [ ! -d "$(pwd)/nvim/bundle/Vundle.vim" ]; then
	echo 'Cloning vim plugin manager (Vundle)'
	mkdir -p "$(pwd)/nvim/bundle/"
	git clone https://github.com/VundleVim/Vundle.vim.git "$(pwd)/nvim/bundle/Vundle.vim"
fi

if [ ! -d "$(pwd)/base16-iterm2" ]; then
	echo 'Cloning base16 color scheme for iterm2'
	git clone https://github.com/chriskempson/base16-iterm2.git ~/base16-iterm2
fi

echo 'Symlink neovim configuration'
rm -rf "$HOME/.config/nvim" # FIXME - OSX specific
ln -s "$(pwd)/nvim" "$HOME/.config/nvim" # FIXME - OSX specific
