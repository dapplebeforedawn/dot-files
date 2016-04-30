#! /usr/bin/env bash
set -e

values=(
  .vimrc:$HOME/.vimrc
  .bashrc:$HOME/.bashrc
  .bash_profile:$HOME/.bash_profile
  .screenrc:$HOME/.screenrc
  .octaverc:$HOME/.octaverc
  .muttrc:$HOME/.muttrc
  .hackpiperc:$HOME/.hackpiperc
  .go-pty-rc:$HOME/.go-pty-rc
  .gitignore:$HOME/.gitignore
  .gitconfig:$HOME/.gitconfig
  .git-prompt.sh:$HOME/.git-prompt.sh
  .git-completion.bash:$HOME/.git-completion.bash
  .ctags:$HOME/.ctags
)

for line in "${values[@]}"; do
  pair=( `echo $line | tr ':' '\n'` )

  dotfilename=${pair[0]}
  dotfilepath=${pair[1]}
  read -n1 -p "Copy $dotfilename to $dotfilepath? [y/n] " answer
  if [ $answer = "y" ]; then
    if [ -f $dotfilepath ]; then
       mv $dotfilepath ${dotfilepath}.bak 2>/dev/null
    fi
    cp $dotfilename $dotfilepath
  fi
  echo ""
done
