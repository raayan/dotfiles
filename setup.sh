set -x

THIS_DIR=$(dirname $(readlink -f $0))

echo dotfile directory: $PWD

echo backing up old configs
mv $HOME/.zshrc $HOME/.zshrc.bak
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.gitconfig $HOME/.gitconfig.bak
mv $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo linking configs
-- zsh
echo "source $THIS_DIR/config.zshrc" > $HOME/.zshrc
echo "export DOTFILE_DIR=$THIS_DIR" >> $HOME/.zshrc
-- vim
echo "source $THIS_DIR/config.vimrc" > $HOME/.vimrc
-- git
echo "[include]" > $HOME/.gitconfig
echo "path = $THIS_DIR/config.gitconfig" >> $HOME/.gitconfig
-- tmux
echo "source-file $THIS_DIR/config.tmux.conf" > $HOME/.tmux.conf
-- alacritty
ALACRITTY_DIR=$HOME/.config/alacritty
mkdir -p $ALACRITTY_DIR
ln -sf $THIS_DIR/config.alacritty.toml $ALACRITTY_DIR/alacritty.toml

echo linking neovim config
NVIM_DIR=$HOME/.config/nvim
mkdir -p $NVIM_DIR
ln -sf $THIS_DIR/nvim/init.lua $NVIM_DIR/init.lua

echo done! restart your shell
