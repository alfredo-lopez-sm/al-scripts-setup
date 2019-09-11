
export JAVA_HOME="$(/usr/libexec/java_home)"

export PATH="/usr/local/opt/gettext/bin:$PATH"

# Alias
alias ll='ls -als'
alias home='cd /Users/$(whoami)'

alias dstop='docker stop'
alias drm='docker rm'
alias dps='docker ps'

# Git bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# AWS completion
complete -C '$(which aws_completer)' aws
