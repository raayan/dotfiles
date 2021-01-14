echo Dotfile Directory: $PWD

echo Backing Up Old Configs
mv $HOME/.zshrc $HOME/.zshrc.bak
mv $HOME/.vimrc $HOME/.vimrc.bak
mv $HOME/.gitconfig $HOME/.gitconfig.bak

echo Making linker configs
echo "source $PWD/config.zshrc" > $HOME/.zshrc
echo "export DOTFILE_DIR=$PWD" >> $HOME/.zshrc
echo "source $PWD/config.vimrc" > $HOME/.vimrc
echo "[include]
    path = $PWD/config.gitconfig" > $HOME/.gitconfig

echo Done! Restart your shell

