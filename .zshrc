autoload -U compinit && compinit

. ~/.bash_profile
# . ~/setupfiles/zsh/rc

# Make Sublime Text 2 the default editor
# the -w bit ensures we wait until returning to the prompt
# to proceed with any commands (good for commits, etc.)
export EDITOR="subl -w"

# Stuff for git
parse_git_status () {
unset __CURRENT_GIT_BRANCH
unset __CURRENT_GIT_BRANCH_STATUS
unset __CURRENT_GIT_BRANCH_IS_DIRTY

local st="$(git status 2>/dev/null)"
if [[ -n "$st" ]]; then
    local -a arr
    arr=(${(f)st})

    if [[ $arr[1] =~ 'Not currently on any branch.' ]]; then
        __CURRENT_GIT_BRANCH='no-branch'
    else
        __CURRENT_GIT_BRANCH="${arr[1][(w)4]}";
    fi

    if [[ $arr[2] =~ 'Your branch is' ]]; then
        if [[ $arr[2] =~ 'ahead' ]]; then
            __CURRENT_GIT_BRANCH_STATUS='ahead'
        elif [[ $arr[2] =~ 'diverged' ]]; then
            __CURRENT_GIT_BRANCH_STATUS='diverged'
        else
            __CURRENT_GIT_BRANCH_STATUS='behind'
        fi
    fi

    if [[ ! $st =~ 'nothing to commit' ]]; then
        __CURRENT_GIT_BRANCH_IS_DIRTY='1'
    fi
fi

if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    local s="("
    s+="$__CURRENT_GIT_BRANCH"
    case "$__CURRENT_GIT_BRANCH_STATUS" in
        ahead)
        s+="↑"
        ;;
        diverged)
        s+="↕"
        ;;
        behind)
        s+="↓"
        ;;
    esac
    if [ -n "$__CURRENT_GIT_BRANCH_IS_DIRTY" ]; then
        s+="⚡"
    fi
    s+=")"

    printf " %s%s" "%{${fg[yellow]}%}" $s
fi

}


# sunburst.vim like colors for prompt
BLACK=$'\033[0m'
RED=$'\033[38;5;167m'
GREEN=$'\033[38;5;71m'
BLUE=$'\033[38;5;111m'
YELLOW=$'\033[38;5;228m'
ORANGE=$'\033[38;5;173m'

function precmd() {
    export PROMPT="%{$GREEN%}%~%{$BLACK%}
\$ "
	export RPROMPT="%{$RED%}$(parse_git_status)%{$BLACK%}"
}

# Source the git bash completion file
# if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
# 	source /usr/local/etc/bash_completion.d/git-completion.zsh
# 	GIT_PS1_SHOWDIRTYSTATE=true
# fi

[ -s "/Users/andrew/.scm_breeze/scm_breeze.sh" ] && source "/Users/andrew/.scm_breeze/scm_breeze.sh"


# Added for Hub - https://github.com/defunkt/hub
eval "$(hub alias -s)"


# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"