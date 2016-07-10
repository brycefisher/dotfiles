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
