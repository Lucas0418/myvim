#!/bin/sh

#backup previous .vimrc, then substitute the new one.
mv ~/.vimrc ~/.vimrc.bak
cp ./vimrc ~/.vimrc

#Update plugins

vim +PluginInstall +qa
