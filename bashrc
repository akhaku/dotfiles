GREEN="\[\033[0;32m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
CLOSE="\[\e[m\]"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="$RED\u@\h$CLOSE:$GREEN\w$CLOSE>$YELLOW\$(parse_git_branch)$CLOSE "

# History
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Convenient aliases
alias grep='grep --color=auto'
alias l='ls -lG'
alias ls='ls -G'
alias ll='ls -alG'

alias tmux='tmux -2'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

_git_rmbranch() {
  _git_branch
}
_git_mvcommit() {
  _git_branch
}

if [ -f "$HOME/.git-completion.bash" ]; then
  source "$HOME/.git-completion.bash"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f "$HOME/.bash_profile.local" ]; then
  source "$HOME/.bash_profile.local"
fi
