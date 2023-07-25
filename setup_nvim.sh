#!/bin/bash
set -x
NVIM_DIR=$HOME/.local/nvim
THIS_DIR=$(dirname $(readlink -f $0))
mkdir -p $NVIM_DIR
ln -sf $THIS_DIR/nvim/init.lua $NVIM_DIR/init.lua
ln -sf $THIS_DIR/nvim/lua $NVIM_DIR/
ln -sf $THIS_DIR/nvim/after $NVIM_DIR/
