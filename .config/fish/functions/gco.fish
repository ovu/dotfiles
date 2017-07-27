function gco --description 'select a git repo using fzf '
      git branch --all | sed 1,2d | sed 's/remotes\/origin\///g' | sort | uniq | fzf | read -l selected

      if [ $selected ] 
        set -l branch (echo $selected >| string trim)
        git checkout $branch
      end
      commandline -f repaint
end
