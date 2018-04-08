local return_code_color="%(?.%{$reset_color%}.%{$fg[red]%})"

function get_username() {
    if [[ $UID -eq 0 ]]; then
         username="%{$terminfo[bold]$fg[red]%}%n%{reset_color%}"
    else
         username="%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}"
    fi
    echo "${username}"
}

function get_hostname() {
    if [[ -f /.dockerenv ]]; then
        hostname="%{$terminfo[bold]$fg[yellow]%}%m%{$reset_color%}"
    else
        hostname="%{$terminfo[bold]$fg[cyan]%}%m%{$reset_color%}"
    fi
    echo "${hostname}"
}

function get_current_dir() {
     if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" && $(command git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]; then
         current_dir="$(git rev-parse --show-toplevel)$fg[yellow]/$(git rev-parse --show-prefix)$reset_color"
     else
         current_dir="$(pwd)"
     fi
     echo "${current_dir}"
}

function get_git_info() {
    if [[ "$(git_current_branch 2>/dev/null)" != "" ]]; then
        echo "|$(parse_git_dirty)$(git_current_branch)%{$reset_color%}"
    fi
}

PROMPT='${return_code_color}┌%{$reset_color%}$(get_username)@$(get_hostname):$(get_current_dir)$(get_git_info)$(git_prompt_status)$(git_prompt_short_sha)
${return_code_color}└➤%{$reset_color%} '
RPROMPT="[%*]"

# Git info
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Git status
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[magenta]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[blue]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[cyan]%}=%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[yellow]%}?%{$reset_color%}"

# Git sha
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" ["
ZSH_THEME_GIT_PROMPT_SHA_AFTER="]%{$reset_color%}"
