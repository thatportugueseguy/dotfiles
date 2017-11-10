# run macos script
# this needs to be run on iterm.. not sure why.
echo "THIS NEEDS TO BE RUN ON ITERM OR IT WILL ERROR AND EXIT TERMINAL.."

# make sure we're in the right folder
# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

#profile karabiner
# doesn't work too well needs to find a solution...
# mkdir -p ~/.karabiner
# cp configs/karabiner/karabiner.json ~/.karabiner/karabiner.json

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerlevel9k install + powerline fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/powerline/fonts.git ~/.fonts
~/.fonts/install.sh

# link dotfiles
./link-dotfiles.sh

#change shell to zsh
echo "Changing shell to Zshell"
chsh -s /bin/zsh

# set defaults for macos
./mac-defaults.sh

# restart to make changes work
echo "We're going to restart now, insert password :D"
echo "Run post-install-list.sh after for more guidance"
sudo shutdown -r now
