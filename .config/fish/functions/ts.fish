function ts --description 'select one session from tmux using fzf'
  tmux ls -F '#{session_attached} #{session_name}' |grep -v '^1' | sort -r | sed 's/^0//g' | fzf --print-query | tail -n1 | awk '{ print $1 }' | read -l selectedSession

  # tmux ls -F '#{session_attached} #{session_name}' |grep -v '^1' | sort -r | sed 's/^0//g' | fzf | tail -n1 |awk '{ print $2  }'| read -l selectedSession

  if [ $selectedSession ]
    tmux switch-client -t $selectedSession
  end

end
