alias lc="lolcommits -l"
alias tton="ec2-start-instances i-5b631d20"
alias ttoff="ec2-stop-instances i-5b631d20"

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
    export PROMPT="%{$GREEN%}%~%{$BLACK%} ] "
	export RPROMPT="%{$RED%}$(parse_git_status)%{$BLACK%}"
}