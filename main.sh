#!/bin/bash
####################################################
# Script name : brew_dump.sh
# Discription :
# How to : # brew_dump.sh
#     \$1 : -
#     \$2 : -
#     Example: # ---.sh
# Date : 2021-09-02 
# @copyright  2021 Bell's market <bellsmarketweb+github@gmail.com>
# @see       https://github.com/bellsmarket

####################################################

function pushBrewFile() {
  cd "$HOME/dotfiles/homebrew"
  git add "$file"
  git commit -m "update $file"
  git push
}


# function main {{{
function main() {
  if [ $(/usr/bin/uname -m) = "x86_64" ]; then
    # Pro
    file="Brewfile-pro"
    rm "$HOME/dotfiles/homebrew/$file"
    $(which brew) bundle dump --file "$HOME/dotfiles/homebrew/$file"
    pushBrewFile
  else
    # Air
    file="Brewfile-air"
    rm "$HOME/dotfiles/homebrew/$file"
    $(which brew) bundle dump --file "$HOME/dotfiles/homebrew/$file" 
    pushBrewFile
  fi
  return 0
}
# }}}


pushBrewFile
# main "$@"
