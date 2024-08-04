# dotfiles
My bare-bones dotfiles

## Usage

The following will clone and move into the repo.
Then it will backup existing config to `*.bak` and create linkages to the `dotfiles` repo
```
git clone https://github.com/raayan/dotfiles
git cd dotfiles
chmod +x setup.sh
./setup.sh
```

### Updating
You can run `dot-update` to update this repo and ultimately your dotfiles.

## ZSH history with FZF
Install `fzf`

curl this <https://raw.githubusercontent.com/joshskidmore/zsh-fzf-history-search/master/zsh-fzf-history-search.zsh>
somewhere and then add to your `.zshrc`:

```bashrc
source <path-to-it>/zsh-fzf-history-search.zsh
```

## SSH GPG YubiKey
Install required programs and add folowing to `.zshrc`

```bashrc
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
```
