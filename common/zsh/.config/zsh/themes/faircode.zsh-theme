function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USERNAME ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo " %{$fg[blue]%}$me%{$reset_color%}"
  fi
}

function _get_virtualenv() {
  local envinfo=$(virtualenv_prompt_info)
  if [[ -n $envinfo ]]; then
    echo "$envinfo "
  else
    echo ""
  fi
}

_current_dir=" %{$fg_bold[cyan]%}%~%{$reset_color%}"
_return_code="%{$fg_bold[red]%}%(?..[code %?])%{$reset_color%}"


#PROMPT='
#%{$fg_bold[blue]%}%T$(_user_host)${_current_dir}$(git_prompt_info)$(git_prompt_status) %{$fg[yellow]%}$(ruby_prompt_info)${_return_status}%{$reset_color%}
#❯ '
PROMPT='
%{$fg_bold[blue]%}%T$(_user_host)$_current_dir$(git_prompt_info)$(git_prompt_status)%{$reset_color%}
$(_get_virtualenv)❯ '
RPROMPT='$_return_code'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[white]%}ﱣ"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%} "
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}"
