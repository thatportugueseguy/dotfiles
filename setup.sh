#!/bin/bash

# make sure we're in the right folder
# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

# install homebrew
# apparently on macs we can't git clone without installing xcode
# so better to install homebrew, then install git and clone..
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# run brew bundle from the configs dir
cd configs/brew
brew bundle

# is it necessary to keep the process running?
# see mathias's dotfiles

# run macos script
cd $SCRIPTPATH
./.macos

#profile karabiner
karabinerConfigDir="$HOME/.karabiner"
if [ -e $karabinerConfigDir ]; then
	mkdir -p $karabinerConfigDir
fi
cp configs/karabiner/karabiner.json "$karabinerConfigDir/karabiner.json"

# link dotfiles
./link-dotfiles.sh

# restart to make changes work
shutdown -r now

# powerlevel9k install + powerline fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
curl -O https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf

# zsh autosuggestions?
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


#final: echo para verificar:
#zsh
#neovim
#config vsc

