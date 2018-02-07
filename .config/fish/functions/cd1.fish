function cd1 --description 'select one directory searching one level using fzf'
  find . -type d -d 1 | fzf | read -l selectedDir
  if [ $selectedDir ]
   cd $selectedDir
  end 
end
