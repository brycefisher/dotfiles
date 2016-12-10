Dotfiles
--------

Objectives:
 - Minimal dependencies
 - Works on OSX and Ubuntu

Mac OS Prerequisites:
 - brew install git curl neovim
 - mkdir -p $HOME/.ssh/github
 - ssh-keygen -b 4096 -f $HOME/.ssh/github/brycefisher
 - Setup .ssh/config
 - install P4Merge from https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools

Ubuntu Prerequisites:
 - sudo apt-get install git curl neovim
 - mkdir -p $HOME/.ssh/github
 - ssh-keygen -b 4096 -f $HOME/.ssh/github/brycefisher
 - Setup .ssh/config

Bootstrapping:

```
git clone git@github.com:brycefisher/dotfiles.git
cd dotfiles
./setup.sh
```
