# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# aliases
alias ll='ls -al'
alias grep='grep --color=auto'
alias cdr='cd $(ghq root)/$(ghq list | peco)'
alias ghb='gh repo view --web'
alias relogin='exec $SHELL -l'
alias dc='docker-compose'
alias drm='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker images -f dangling=true -q)'
alias tf='terraform'

# Show git branch
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '

# peco
peco-select-history() {
  local action
  action="$(history | peco | cut -c 8-)"
  history -s "$action"
  READLINE_LINE="${action}"
  READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-r": peco-select-history'

# direnv
eval "$(direnv hook bash)"

# anyenv
eval "$(anyenv init -)"
eval "$(nodenv init -)"

ulimit -n 1024
