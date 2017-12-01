function cdf --description 'select one directory using fzf'
  set -l foldersToExclude '\.git\|\.vscode\|node_modules\|bower\|logs\|generated\|dist\|build\|\.DS_Store'
  find . -type d | grep -v $foldersToExclude | fzf | read -l selectedDir
  cd $selectedDir
end
