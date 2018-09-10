# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ $- != *i* ]]; then
  return
fi

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

shopt -s histappend
PROMPT_COMMAND='history -a'
HISTCONTROL=ignoredups:ignorespace

shopt -s checkwinsize

# xterm title:
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\n\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac
