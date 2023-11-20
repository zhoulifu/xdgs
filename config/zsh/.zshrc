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
safe_source $ZDOTDIR/addi_plugins.sh

export ZSH="$ZDOTDIR/ohmyzsh"
safe_source $ZSH/oh-my-zsh.sh
# }}}

for _rc_file in `find $ZDOTDIR/rc.d -follow -mindepth 1 -maxdepth 1 -type f ! -name '_*'`; do
  source $_rc_file
done

unset -f $ZDOTDIR/autoloads/_transient/*(.:t)

# vim: foldmethod=marker
