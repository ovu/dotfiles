function passf --description 'select one element from pass'
  find ~/.password-store -name '*.gpg' | sed 's/^.*password-store\///' | sed 's/.\{4\}$//' | fzf | read -l selectedDir
  pass -c $selectedDir
end
