echo Dotfile Directory: $PWD

echo Backing Up Old Configs
mv $HOME/.zshrc $HOME/.zshrc.bak
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.gitconfig $HOME/.gitconfig.bak
mv $HOME/.tmux.conf $HOME/.tmux.conf.bak

echo Making linker configs
echo "source $PWD/config.zshrc" > $HOME/.zshrc
echo "export DOTFILE_DIR=$PWD" >> $HOME/.zshrc
echo "source $PWD/config.vimrc" > $HOME/.vimrc
echo "[include]\n\tpath = $PWD/config.gitconfig" > $HOME/.gitconfig
echo "source-file $PWD/config.tmux.conf" > $HOME/.tmux.conf

echo Done! Restart your shell

