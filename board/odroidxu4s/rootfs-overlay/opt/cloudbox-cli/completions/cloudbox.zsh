if [[ ! -o interactive ]]; then
    return
fi

compctl -K _cloudbox cloudbox

_cloudbox() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(cloudbox commands)"
  else
    completions="$(cloudbox completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
