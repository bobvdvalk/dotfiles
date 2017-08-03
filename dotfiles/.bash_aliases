#
#!/bin/bash
#

alias lock="light-locker-command --lock"
alias push="git push"
alias commit="git commit"
alias pull="git pull"

function portfwd {
  for i in ${@:2}
  do
    echo Forwarding port $i
    ssh -N -L $i:localhost:$i $1 &
  done
}

include "$BASH_SOURCE$EXTEND"
