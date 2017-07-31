
# Source a git completion script
if [ -f ~/.gitprompt.sh ]; then
       . ~/.gitprompt.sh
       #. ~/.git-status-prompt.sh
else
  echo "Could not find git prompt "
fi
 
export PATH=$PATH:$HOME/.local/bin

# Add powerline
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config

# Add Go Home to path
export GOPATH=~/goHome
export PATH=$PATH:$GOPATH/bin
# Add path to scripts
export PATH=$PATH:$HOME/scripts

# Alias from dotfiles

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
# alias v="gvim -v"
alias x="exit"
alias m="/opt/local/bin/mutt"
alias mchef="~/mongochef-3.2.4-linux-x64-dist/bin/mongochef.sh"
alias w="curl -4 http://wttr.in/Munich"
function wp() {  curl -4 http://wttr.in/$1;}
alias g="gulp"
function mkcd() {   [ -n "$1" ] && mkdir -p "$@" && cd "$1";   }
# programs
alias slt='open -a "Sublime Text"'
# also/or do this:
# ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl


# be nice
alias please=sudo
alias hosts='sudo $EDITOR /etc/hosts'


# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
        colorflag="--color"
else # OS X `ls`
        colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"


# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
        alias ls="command ls -G"
else
        alias ls="command ls --color"
        export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi

# `cat` with beautiful colors. requires Pygments installed.
#                                                            sudo easy_install Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# GIT STUFF

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"


# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git mediate
export EDITOR=vim


# functions for fuzzyfinder
# https://github.com/junegunn/fzf
# Add fzf in the path
export PATH=$PATH:~/.fzf/bin

foldersToExclude='\.git\|\.vscode\|node_modules\|bower\|logs\|generated\|dist\|build\|\.DS_Store'

# Some aliase to use fzf with git
function gco() {
  git checkout $(git branch --all --color=never | sed 's/remotes\/origin\///g' | sort | uniq | fzf )
}

function vimf() {
  file=$(find . | grep -v $foldersToExclude | fzf) && vim "$file"
}

function cdf() {
  dir=$(find . -type d | grep -v $foldersToExclude | fzf) && cd "$dir"

}

function createCtags() {
  # You have to install 'npm install -g jsctags' to use this command
  find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -not -path "./dist/*" -not -path ".*/bundle.js" -not -path ".*/*vendor.js" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
}

fish
