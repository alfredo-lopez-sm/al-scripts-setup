
# Silence bash from mac for now
export BASH_SILENCE_DEPRECATION_WARNING=1

# get the credentials for satis
source "/Users/$(whoami)/.satis/credentials.sh"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="~/.symfony/bin:$PATH"

# Alias
alias ll='ls -als'
alias home='cd /Users/$(whoami)'
alias projects='cd ~/IdeaProjects'
alias clone='_clone'

#  Docker alias
alias dstop='docker stop'
alias dstopall='docker stop $(docker ps -a -q)'
alias drmall='docker stop $(docker ps -a -q)'
alias dpsall='docker ps -a'
alias drm='docker rm'
alias dps='docker ps'

#  Brew alias
alias bslist='brew services list'
alias bsrestart='brew services restart'
alias bsstart='brew services start'
alias bsstop='brew services stop'
alias cellar="cd /usr/local/Cellar"
alias cask="cd /usr/local/Caskroom"

# Git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# Clone git
_clone ()
{
    cd "/Users/alfredolopez/IdeaProjects"
    git clone "$1"
    name=$(echo "$1" | sed -E 's/.*searchmetrics\/(.*)\.git/\1/')
    name="/Users/alfredolopez/IdeaProjects/$name"
    echo ""
    echo "******************************"
    echo "Cloned into:"
    echo "$name"
    echo "******************************"
    echo ""
    return 0
}

# SSH completion
_complete_ssh_hosts ()
{
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts 2>/dev/null | \
                    cut -f 1 -d ' ' | \
                    sed -e s/,.*//g | \
                    grep -v ^# | \
                    uniq | \
                    grep -v "\[" ;
                    cat ~/.ssh/config 2>/dev/null | \
                    grep "^Host " | \
                    awk '{print $2}';
                    cat /etc/hosts 2>/dev/null| \
                    grep --extended-regexp "^[0-9]{3}\." | \
                    awk '{print $2}'
                    `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
    return 0
}
complete -F _complete_ssh_hosts ssh

# AWS completion
complete -C '$(which aws_completer)' aws

# Generic completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Evaluation for java env needed
eval "$(jenv init -)"