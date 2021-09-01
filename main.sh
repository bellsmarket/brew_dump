#!/bin/bash
####################################################
# Script name : ---.sh
# Discription :
# How to : # ---.sh
#     \$1 : -
#     \$2 : -
#     Example: # ---.sh
# Date : 2021-09-02 
# @copyright  2021 Bell's market <bellsmarketweb+github@gmail.com>
# @see       https://github.com/bellsmarket

####################################################


# function main {{{
function main() {
  if [ $(/usr/bin/uname -m) = "x86_64" ]; then
    # Pro
    rm "$HOME/dotfiles/homebrew/Brewfile-pro"
    $(which brew) bundle dump --file "$HOME/dotfiles/homebrew/Brewfile-pro"
  else
    # Air
    rm "$HOME/dotfiles/homebrew/Brewfile-air"
    $(which brew) bundle dump --file "$HOME/dotfiles/homebrew/Brewfile-air" 
  fi
  return 0
}
# }}}
main "$@"
