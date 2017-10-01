#!/bin/bash
#TODO
# comando instala brew
# git clone dos dotfiles para uma certa dir
# executa comando para nunca desligar monitor
# brew bundle a apontar para o brewfile
===> falta meter as epps
sudo brew cask install \
  google-chrome \
  visual-studio-code \
  iterm2 \
  firefox \
  the-unarchiver \
  docker \
  docker-toolbox \
  flux \
  alfred \
  apache-couchdb \
  appcleaner \
  dash \
  daisydisk \
  discord \
  graphiql \
  karabiner-elements \
  microsoft-office \
  postman \
  zoomus \
  skype \
  skype-for-business \
  whatsapp \
  tunnelblick \
  spotify
# corre .macos => ja acerta tempos para desligar monitor
./.macos
#profile karabiner
#reinicia computador
# instala oh-my-zsh, que já altera shell para zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#powerlevel9k install + powerline fonts
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
curl -O https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
#zsh autosuggestions? 
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

#linka dotfiles
npm i -g nativefier
nativefier messenger.com


#final: echo para verificar:
#zsh
#neovim
#config vsc

