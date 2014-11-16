for dotfile in .gitconfig .zshrc .tmux.conf .vimrc .vim; do
  [ -e ~/$dotfile ] && mv ~/$dotfile ~/$dotfile.old
  ln -s ~/.dotfiles/$dotfile ~/$dotfile
done
