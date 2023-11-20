function {
  local dirs=($ZDOTDIR/autoloads/[^_]*(/:t))
  for _init in $dirs; do
    ! command_exists $_init || safe_source $ZDOTDIR/autoloads/$_init/_init
  done
}

[ -n "${JAVA_HOME}" ] && function {
  local java_bin=$JAVA_HOME/bin
  export PATH=${java_bin}:${PATH//${java_bin}:}
}

function {
  local home_bin=$HOME/bin
  export PATH=${home_bin}:${PATH//${home_bin}:}
}
