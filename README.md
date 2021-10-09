# confighamac
Config files to deploy everywhere

## Deploy

[Harfangk - Manage dotfiles with a git bare repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

TLDR :

```bash
echo 'alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles" >> .gitignore
git clone --bare https://www.github.com/username/repo.git $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
```

---

Most of the files can be directly sinced with local configuration.\
For some, additional software are needed. See below:

## zsh

zshrc uses plugin manager "oh-my-zsh".\
Make sure it is properly installed, along with the themes in use.

## i3

### Requirements

Following softwares are currently required:

* picom: handle windows transparency
* feh: add a background

## vim

### Requirements

Following softwares are currently required:

* cscope, ctags

Vim configuration uses Vundle as plugin manager:

$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

