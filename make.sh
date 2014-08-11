#!/bin/bash

# Script to set a the symlinks

dir=~/.dotfiles
backup=~/.dotfiles_backup
files="zshrc gitconfig vimrc tmux.conf"
# files="zshrc gitconfig irbrc vimrc gvimrc tmux.conf mpdconf conkyrc"
#folders="vim"

# create backup dir
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

# backup old dotfiles and create symlinks
for file in $files; do
  if [[ `readlink -f ~/.$file` == $dir/$file ]]; then
    echo "~/.$file already points to $dir/$file"
  else
    echo "readlink: `readlink -f ~/.$file` != $dir/$file"
    echo "Moving ~/.$file to $backup"
    mv ~/.$file $backup/
    echo "Creating symlink to $dir/$file in home"
    ln -s $dir/$file ~/.$file
  fi
done

## backup old dotfiles and create symlinks
#for folder in $folders; do
#  if [[ `readlink -f ~/.$folder` == $dir/$folder ]]; then
#    echo "~/.$folder already points to $dir/$folder"
#  else
#    echo "readlink: `readlink -f ~/.$folder` != $dir/$folder"
#    echo "Moving ~/.$folder to $backup"
#    mv ~/.$folder $backup/
#    echo "Creating symlink to $dir/$folder in home"
#    if [ ! -d ~/.$folder ]; then
#      ln -s $dir/$folder ~/.$folder
#    fi
#  fi
#done

## special cases
#
## Terminator
#echo "Special Case Terminator"
#specialpath=~/.config/terminator/config
#special="terminator_config"
#if [[ `readlink -f $specialpath` == $dir/$special ]]; then
#  echo "$specialpath already points to $dir/$special"
#else
#  echo "Moving $specialpath to $backup/$special"
#  mv $specialpath $backup/$special
#  echo "Creating symlink to $dir/$special from $specialpath"
#  ln -s $dir/$special $specialpath
#fi
#
## tint2
#echo "Special Case tint2"
#specialpath=~/.config/tint2/tint2rc
#special="tint2rc"
#if [[ `readlink -f $specialpath` == $dir/$special ]]; then
#  echo "$specialpath already points to $dir/$special"
#else
#  echo "Moving $specialpath to $backup/$special"
#  mv $specialpath $backup/$special
#  echo "Creating symlink to $dir/$special from $specialpath"
#  ln -s $dir/$special $specialpath
#fi

echo "All Done!"
