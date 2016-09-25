#!/bin/bash

backupdir=~/Backup/initial_dotfiles

dotfiles=(           \
    ".bashrc"        \
    ".bashrc_common" \
    ".gitconfig"     \
    ".screenrc"      \
    ".vim"           \
    ".vimrc"         \
)

# Make backup directory
if [ -e ${backupdir} ]; then
    echo "Error: Directory ${backupdir} exists"
    exit 1
fi
mkdir -p ${backupdir}

# Make symbolic link of dotfiles
for f in ${dotfiles[@]}; do
    if [ -e ~/$f ]; then
        mv ~/$f ${backupdir}
    fi
    realpath=`readlink -f $f`
    ln -s ${realpath} ~/$f
done

# Install vim plugins
git clone https://github.com/Shougo/dein.vim ~/.vim/dein
vim +":call dein#install()" +:q
