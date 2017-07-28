alias v="vim"
alias x="exit"
alias g="gulp"
alias mchef="~/mongochef-3.2.4-linux-x64-dist/bin/mongochef.sh"
alias jtags="find . -type f -iregex '.*\.js\$' -not -path './node_modules/*' -not -path './dist/*' -not -path '.*/bundle.js' -not -path '.*/*vendor.js' -not -path '.*/*app.js' | xargs jsctags {} -f | sed '/^\$/d' | sort > tags"

alias tags="hasktags --ctags ."

set fish_color_command "purple"
set fish_color_autosuggestion "yellow"