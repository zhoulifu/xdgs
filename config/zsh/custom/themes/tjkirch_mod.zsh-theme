ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡"

git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function prompt_char {
  [ $UID -eq 0 ] && echo "%{$fg[red]%}#%{$reset_color%}" || echo '>'
}

if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
  PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%} %(1j.📋.)%_
$(prompt_char)'
else
  PROMPT='%(?,,%{$fg[red]%}FAIL: $?%{$reset_color%}
)%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%} %(1j.📋.)%_
$(prompt_char)'
fi

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
