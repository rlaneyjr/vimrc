#!/usr/bin/env bash
set -e

if [[ -d "~/.vim_runtime" && ! -L "~/.vim_runtime" ]]; then
    echo "Backing up ~/.vim_runtime to ~/.vim_runtime_backup"
    mv ~/.vim_runtime ~/.vim_runtime_backup;
elif [[ -L "~/.vim_runtime" ]]; then
    echo "Unlinking ~/.vim_runtime"
    unlink ~/.vim_runtime;
fi

if [[ -f "~/.vimrc" && ! -L "~/.vimrc" ]]; then
    echo -e "Moving ~/.vimrc to ~/.vimrc_backup"
    mv ~/.vimrc ~/.vimrc_backup
elif [[ -L "~/.vimrc" ]]; then
    echo -e "Unlinking ~/.vimrc"
    unlink ~/.vimrc
fi

echo "Linking ~/.vim_runtime"
ln -s $PWD ~/.vim_runtime;
echo "Linking ~/.vimrc"
ln -s $PWD/source_vimrc ~/.vimrc;

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"

exit 0
