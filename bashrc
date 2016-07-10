#!/bin/bash -eu

DOTFILE_DIR=$(dirname $BASH_SOURCE)

# Setup git autocompletions in bash
source "$DOTFILE_DIR/git-completion.bash"

# Setup aliases I like
alias cdg='cd $HOME/Projects/garbanzo'
alias g='git'
alias vim='nvim'

# Makefile completions
# From http://stackoverflow.com/questions/33760647/makefile-autocompletion-on-mac/36044470#36044470
function _makefile_targets {
    local curr_arg;
    local targets;

    # Find makefile targets available in the current directory
    targets=''
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$( \
            grep -oE '^[a-zA-Z0-9_-]+:' Makefile \
            | sed 's/://' \
            | tr '\n' ' ' \
        )
    fi

    # Filter targets based on user input to the bash completion
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${targets[@]}" -- $curr_arg ) );
}
complete -F _makefile_targets make