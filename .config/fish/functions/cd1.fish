function cd1 --description 'select one directory searching one level using fzf'
  ls -d */ | fzf | read -l selectedDir
  if [ $selectedDir ]
   cd $selectedDir
  end 
end
