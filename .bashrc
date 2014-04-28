export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s /Users/markjlorenz/.nvm/nvm.sh ]] && . /Users/markjlorenz/.nvm/nvm.sh # This loads NVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=${PATH}:$(find ${HOME}/bin -type d | paste -s -d: -)

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias gs="git status"
alias gc="git commit"
alias gdc="git diff --cached"
alias gp='git push origin `git symbolic-ref HEAD`'
alias be="bundle exec"
alias gosetup="cd ~/Go; gvm use 1.2; gvm pkgset use --local; cd -"
alias iso8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'

function minutes_since_last_commit {
    git branch &>/dev/null
    if [ $? -eq 0 ]; then
      now=`date +%s`
      last_commit=`git log --pretty=format:'%at' -1`
      seconds_since_last_commit=$((now-last_commit))
      minutes_since_last_commit=$((seconds_since_last_commit/60))

      echo "${minutes_since_last_commit}m"
    fi
}

function setup_ps1 {
  if [ -d .git ]; then
    export PS1='\W$(__git_ps1 "(%s|`minutes_since_last_commit`)") → '
  else
    export PS1='\W → '
  fi
}

if [ -f ~/.git-completion.bash  ]; then . $HOME/.git-completion.bash; fi
if [ -f ~/.git-prompt.sh  ]; then . $HOME/.git-prompt.sh; fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_COMMAND="setup_ps1"
