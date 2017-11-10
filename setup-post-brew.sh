# run macos script
# this needs to be run on iterm.. not sure why.
echo "THIS NEEDS TO BE RUN ON ITERM OR IT WILL ERROR AND EXIT TERMINAL.."

# make sure we're in the right folder
# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH
./.macos

#profile karabiner
mkdir -p ~/.karabiner
cp configs/karabiner/karabiner.json ~/.karabiner/karabiner.json

# link dotfiles
./link-dotfiles.sh


# powerlevel9k install + powerline fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
curl -O https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf

# zsh autosuggestions?
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

#change shell to zsh
echo "Changing shell to Zshell"
chsh -s /bin/zsh

# restart to make changes work
echo "We're going to restart now, insert password :D"
echo "Run post-install-list.sh after for more guidance"
sudo shutdown -r now
