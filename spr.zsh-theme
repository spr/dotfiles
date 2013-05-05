# user@host (git stuff) exit code
# path:$

PROMPT='%F{green}%n%f@%F{blue}%m%f $(git_prompt_info) $(git_remote_status) $(git_prompt_status)%{$reset_color%} %(?.. %{$fg_bold[red]%}%?%{$reset_color%} )
%F{red}%~%f%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="git:%F{blue}(%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}) %F{9}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue}) %F{10}✔"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{88}⬇"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{14}⬆"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%F{9}⬌"

ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{8}?"
ZSH_THEME_GIT_PROMPT_ADDED="%F{10}✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{20}±"
ZSH_THEME_GIT_PROMPT_DELETED="%F{1}−"
ZSH_THEME_GIT_PROMPT_STASHED="%F{5}⬋"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{9}∉"


# vim: ft=zsh
