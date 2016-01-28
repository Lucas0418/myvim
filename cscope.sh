#!/bin/sh
[ $# -ne 1 ]&&echo "Usage:cscope.sh {source code path}"&&exit 1
[ ! -d $1 ]&&echo "Usage:cscope.sh {source code path}"&&exit 1
string="cs add $1/cscope.out $1"
cd $1
find . -name "*.h" -o -name "*.c" -o -name "*.php" -o -name "*.css" > file_list.cs
cscope -Rbkq -i file_list.cs||(echo "create cscope.out error";exit 1)
rm file_list.cs
cp ~/.vim/cscope.vim ~/.vim/cscope.vim.bak
grep "$string" ~/.vim/cscope.vim 2>&1 1>/dev/null
if [ $? -ne 0 ];then
sed '/if has("cscope")/a\
'"$string" ~/.vim/cscope.vim.bak>~/.vim/cscope.vim
fi
cscopeout_list=`sed -n 's#^cs add \(.*\)/cscope\.out \1$#\1/cscope.out#p' ~/.vim/cscope.vim`
for a in $cscopeout_list
do
  if [ ! -f $a ] ;then
    sed -i '\!'"$a"'!d' ~/.vim/cscope.vim
  fi
done
