for dotfile in .zshrc .vimrc .vim; do
  [ -e ~/$dotfile ] && rm -rf ~/$dotfile
  ln -s ~/.dotfiles/$dotfile ~/$dotfile
done
