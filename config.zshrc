# Raayan's zshrc
# Created 2020-06-05

# Load builtins
autoload -Uz vcs_info

# VCS Info
## Loadup version control info on every commmand
precmd() { vcs_info }
## Format vcs_info to what you want
zstyle ':vcs_info:git:*' formats '[%F{cyan}%b%f] '
## Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{magenta}%n%f@%F{red}%m%f ${PWD/#$HOME/~} ${vcs_info_msg_0_}$ '

export CLICOLOR=1


# Setup Path
export PATH=$PATH:$HOME/bin
export LANG=en_US.UTF-8
export EDITOR='vim'

# Aliases
alias rsc="source ~/.zshrc"
alias rc="vim ~/.zshrc; rsc"
alias vrc="vim ~/.vimrc"
dot-update() {
	(cd $DOTFILE_DIR && git stash && git fetch --all && git reset --hard origin/master)
}

# VI Mode
bindkey -v

# GPG SSH Support
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent