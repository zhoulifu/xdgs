#  Ohmyzsh initialization {{{1
ZSH_THEME="tjkirch_mod"
DISABLE_AUTO_TITLE="true"
ZSH_CUSTOM="$ZDOTDIR/custom"

plugins=(
  git
  common-aliases
  vi-mode
  zsh-syntax-highlighting
)
safe_source -s $ZDOTDIR/addi_plugins.sh

export ZSH="$ZDOTDIR/ohmyzsh"
# }}}

alias clrhist='sort -t ";" -k 2 $HISTFILE -u | sort -o $HISTFILE'
alias -g C='| column -t'

function {
  local rcs=($ZDOTDIR/rc.d/**/*(.))
  for rc in $rcs; do
    source $rc
  done
}

function {
  local dirs=($ZDOTDIR/autoloads/[^_]*(/:t))
  for _init in $dirs; do
    ! command_exists $_init || safe_source $ZDOTDIR/autoloads/$_init/_init
  done
}

safe_source $ZSH/oh-my-zsh.sh

unset -f $ZDOTDIR/autoloads/_transient/*(.:t)

# vim: foldmethod=marker
