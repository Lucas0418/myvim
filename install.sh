#!/bin/sh

mkdir -p ~/.vim
#copy .vim/* to ~/.vim/
cp -r .vim/* ~/.vim/

#backup previous .vimrc, then substitute the new one.
mv ~/.vimrc ~/.vimrc.bak
cp ./vimrc ~/.vimrc
