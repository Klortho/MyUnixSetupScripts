# bash setup script

unset LC_ALL
export LANG=en_US.UTF-8
umask 0002
set -o vi

export PATH=~/bin:$PATH

#-----------------------------------------------------------
# Mac shortcuts

# To show/hide hidden files in Finder:

alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

#-----------------------------------------------------------
# Aliases and shortcuts

# Command shortcuts
alias d='less'
alias g='egrep'
alias gr="egrep -r"
alias p='perl'
alias ll='ls -lad'

# Make and change directory
mcdir() {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Reload the current shell, reading all the login scripts again
alias reload='exec bash -l'

#-----------------------------------------------------------
# Searching (pilfered these off the interwebs)
# ff:  to find a file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# ffs: to find a file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# ffe: to find a file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

# Find in files, excluding common tool directories. Usage:
#   fif <pattern> <file-glob>
# Where <pattern> is a string regexp, and <file-glob> describes the subset
# of files to search.
# The flags of egrep used here are:
#   -s - silent mode - don't report unreadables
#   -H - always print filenames
#   -i - ignore case
#   -I - ignore binary files
#   -r - recurse subdirs
function fif () {
  echo 'Searching for pattern '"'$1'"' in files matching '"'$2'"
  egrep -sHiIr --exclude-dir=.git \
      --exclude-dir=.svn \
      --exclude-dir=node_modules \
      --include="$2" "$1" .
}

# Here's another way to do the same thing:
#function fif () { 
#  find . -type f -name "$2" \
#    -exec egrep -H -i "$1" {} \;
#}

#-----------------------------------------------------------
# git shortcuts
alias gs='git status'

#-----------------------------------------------------------
# finish up
PATH=.:$HOME/bin:$PATH
export PATH
