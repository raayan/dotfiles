echo Dotfile Directory: $PWD

echo Backing Up Old Configs
mv $HOME/.zshrc $HOME/.zshrc.bak
mv $HOME/.vimrc $HOME/.vimrc.bak

echo Making linker configs
echo "source $PWD/config.zshrc" > $HOME/.zshrc
echo "export DOTFILE_DIR=$PWD" >> $HOME/.zshrc
echo "source $PWD/config.vimrc" > $HOME/.vimrc

echo Done! Restart your shell