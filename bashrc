export VISUAL=vim
export EDITOR=vim
alias ls='ls --color=auto'
[ ! "$UID" = "0" ] && archey3 -c blue
[  "$UID" = "0" ] && archey3 i -c red
PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

# dropbox

alias dropbox="~/.dropbox-dist/dropboxd" #load dropbox daemon

# privileged access

if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias kick='sudo reboot'
    alias halt='sudo halt'
    alias update='sudo pacman -Syyu'
    alias netcfg='sudo netcfg2'
    alias vol='sudo modprobe snd_mixer_oss'
fi

# pacman aliases (if applicable, replace 'pacman' with your favourite AUR helper)
if [ $UID -ne 0 ]; then
  alias pac="sudo pacman -S"      # default action     - install one or more packages
  alias pacu="sudo pacman -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
  alias pacs="sudo pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
  alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
  alias pacr="sudo pacman -R"     # '[r]emove'         - uninstall one or more packages
  alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
  alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
  alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
  alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
  alias pacf="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
  alias pacc="sudo pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
fi
  alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory
  alias aur="packer -Syyu" # - upgrade AUR compnents via packer

#Functions

#Create archive

compress () {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar)      shift && tar cf $FILE $* ;;
        *.tar.bz2)  shift && tar cjf $FILE $* ;;
        *.tar.gz)   shift && tar czf $FILE $* ;;
        *.tgz)      shift && tar czf $FILE $* ;;
        *.zip)      shift && zip $FILE $* ;;
        *.rar)      shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <archive.tar.gz> <archive> <files>"
    fi
}

#Unpack archive

unpack() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1    ;;
            *.tbz2)     tar xjf $1    ;;
            *.tar.gz)   tar xzf $1    ;;
            *.tgz)      tar xzf $1    ;;
            *.bz2)      bunzip2 $1    ;;
            *.rar)      unrar x $1    ;;
            *.gz)       gunzip $1     ;;
            *.tar)      tar xf $1     ;;
            *.zip)      unzip $1      ;;
            *.Z)        uncompress $1 ;;
            *.7z)       7z x $1       ;;
            *) echo -e ${YELLOW}"'$1' cannot be unpacked"${RESET} ;;
        esac
    else
        echo -e ${YELLOW}"'$1' is an invalid file"${RESET}
    fi
}


#Generate random password

genpasswd() {
        local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
