function gco --description 'select a git repo using fzf '
      set -l branchesToExclude '\*\|HEAD'
      git branch --all | grep -v $branchesToExclude | sed 's/remotes\/origin\///g' | sort | uniq | fzf | read -l selected

      if [ $selected ] 
        set -l branch (echo $selected >| string trim)
        git checkout $branch
      end
      commandline -f repaint
end
