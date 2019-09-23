
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Alias
alias ll='ls -als'
alias home='cd /Users/$(whoami)'

alias dstop='docker stop'
alias dstopall='docker stop $(docker ps -a -q)'
alias drm='docker rm'
alias dps='docker ps'

# Git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
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