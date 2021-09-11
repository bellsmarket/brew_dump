#!/bin/bash
####################################################
# Script name : brew_dump.sh
# Discription : The BrewDumpfile will be backed up automatically.
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
  git pull
  git add "$file"
  git commit -m "update $file"
  git push
}

function downloadBrewDumpFile() {
  if [ -f "$HOME/dotfiles/homebrew/$file" ];then
    rm -v "$HOME/dotfiles/homebrew/$file"
    echo "File Exists. So File is exchange."
  fi
  $(which brew) bundle dump --file "$HOME/dotfiles/homebrew/$file"
}

# function main {{{
function main() {
  if [ $(/usr/bin/uname -m) = "x86_64" ]; then
    # Pro
    file="Brewfile-pro"
    downloadBrewDumpFile
    pushBrewFile
  else
    # Air
    file="Brewfile-air"
    downloadBrewDumpFile
    pushBrewFile
  fi
  return 0
}
# }}}


# pushBrewFile
main "$@"
