#!/bin/bash -eu

if [ ! -f "$(pwd)/git-completion.bash" ]; then
	echo 'Downloading git completions for bash'
	curl -sSO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

echo 'Ensuring the bashrc file in this directory is always sourced in .bashrc'
SOURCE_BASHRC="source $(pwd)/bashrc"
grep -q "$SOURCE_BASHRC" "$HOME/.profile" || echo "$SOURCE_BASHRC" >> "$HOME/.profile"

echo 'Symlink git configuration'
rm -f "$HOME/.gitconfig"
ln -s "$(pwd)/gitconfig" "$HOME/.gitconfig"
