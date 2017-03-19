#!/bin/bash
set -euf -o pipefail

# Create .config directory
mkdir -p ~/.config

# Symlink dotfiles, backup old
echo "Symlinking dotfiles..."
for dotfile in .gitconfig .zshrc .tmux.conf .vimrc .config/redshift.conf; do
  [ -e ~/$dotfile ] && mv ~/$dotfile ~/$dotfile.old
  ln -s ~/.dotfiles/$dotfile ~/$dotfile
done

# Install vim-plug
if [ -e ~/.vim/autoload/plug.vim ]; then
  echo "vim-plug already installed."
else
  echo "Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install rbenv
if [ -e ~/.rbenv ]; then
  echo "rbenv already installed."
else
  echo "Installing rbenv..."
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src || echo "rbenv dynamic shell extension failed to compile."
fi

# Install ruby-build
if [ -e ~/.rbenv/plugins/ruby-build ]; then
  echo "ruby-build already installed."
else
  echo "Installing ruby-build..."
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

echo "Done!"
