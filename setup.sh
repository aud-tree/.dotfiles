for dotfile in .gitconfig .zshrc .tmux.conf .vimrc .vim; do
  [ -e ~/$dotfile ] && mv ~/$dotfile ~/$dotfile.old
  ln -s ~/.dotfiles/$dotfile ~/$dotfile
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
