#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# user-defined aliases
alias r="radian"
alias sudo='sudo '

alias update="paru" # paru already updates *all* packages
#alias update="yay"

# requires AUR reflector package
alias reflector='sudo reflector --country USA,Canada --protocol https --age 12 --number 20 --sort rate --save /etc/pacman.d/mirrorlist'

#alias autoremove="pacman -Rs $(pacman -Qqtd)"
alias ping='ping -c 5'
alias pdfmerge='pdfunite'
alias ls-size='ls -l --block-size=MB'
alias ls='ls --color=auto'

# a lazy way to move up the filesystem
alias up1='cd ../'
alias up2='cd ../../'
alias up3='cd ../../../'
alias up4='cd ../../../../'
alias up5='cd ../../../../../'

# fuzzy search for packages using pacman/paru and fzf package
# alias pacfind='pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S'
# alias parfind='paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S'

# different fuzzy search implementation using sk package
# paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | sk --multi --preview 'paru -Si {1}' --reverse | xargs -ro paru -S

# aliases specific to Manjaro Linux distribution
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# set the shell prompt user@hostname to a specific color (green=32)
#export PS1="\e[0;32m[\u@\h \W]\$ \e[m"
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
#export PS1="\[[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[00m\]]\$ "
eval $(dircolors -p | perl -pe 's/^((CAP|S[ET]|O[TR]|M|E)\w+).*/$1 00/' | dircolors -)

# https://www.tecmint.com/view-colored-man-pages-in-linux/
export PAGER="most"
