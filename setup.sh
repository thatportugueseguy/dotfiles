#!/bin/bash

# make sure we're in the right folder
# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

# install homebrew
# apparently on macs we can't git clone without installing xcode
# so better to install homebrew, then install git and clone the repo..
echo "Running this script assumes homebrew is installed, and you runned brew git as well"


# run brew bundle from the configs dir
cd configs/brew
brew bundle

cd ..
# copy iterm profile file
cp iterm-profile.json "~/Library/Application Support/iTerm2/DynamicProfiles"
open $SCRIPTPATH/setup-post-brew.sh -a iterm

