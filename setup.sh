for dotfile in .gitconfig .zshrc .tmux.conf .vimrc .vim; do
  [ -e ~/$dotfile ] && rm -rf ~/$dotfile
  ln -s ~/.dotfiles/$dotfile ~/$dotfile
done
