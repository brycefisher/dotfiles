Dotfiles
--------

Objectives:
 - Minimal dependencies
 - Works on OSX (probably not anywhere else, like Ubuntu)

Prerequisites:
 - brew install git
 - mkdir -p $HOME/.ssh/github
 - ssh-keygen -b 4096 -f $HOME/.ssh/github/bryce_rsa (setup a password)
 - ssh-add -K $HOME/.ssh/github/bryce_rsa (add password from previous step)
 - install P4Merge from https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools

Bootstrapping:

```
git clone git@github.com:brycefisher/dotfiles.git
cd dotfiles
./setup.sh
```


TODOS:

 * [ ] - add base16 to iTerm2. For now, manual step
 * [ ] - add powerline font (preferred, patched Source Code Pro) to iTerm2. For now manual step
