export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

[[ -z $ZDOTDIR ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

function {
  local compiled=$ZDOTDIR/autoloads/all_functions.zwc
  local _fpath=()
  [[ -f $compiled ]] && {
    _fpath+=$compiled
  } || {
    _fpath=($ZDOTDIR/autoloads $ZDOTDIR/autoloads/*(/))
  }

  fpath=($_fpath $fpath)
}

autoload -Uz $ZDOTDIR/autoloads/[^_]*(.:t) $ZDOTDIR/autoloads/_transient/*(.:t)
