#
#!/bin/bash
#

alias lock="light-locker-command --lock"
alias push="git push"
alias commit="git commit"
alias pull="git pull"

function portfwd {
  args=""

  for i in ${@:2}
  do
    echo Forwarding port $i
    args="$args -L $i:localhost:$i"
  done

  ssh $1 $args
}

include "$BASH_SOURCE$EXTEND"
