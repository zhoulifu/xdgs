command_exists() {
  command -v "$@" &> /dev/null
}

safe_source() {
  [ -f "$@" ] && source "$@" || {
    echo "No such file: $@"
    true
  }
}
