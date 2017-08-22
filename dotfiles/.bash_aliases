#
#!/bin/bash
#

alias lock="light-locker-command --lock"
alias push="git push"
alias commit="git commit"
alias pull="git pull"
alias sonar='mvn clean verify sonar:sonar -Dsonar.branch=`git rev-parse --abbrev-ref HEAD`'

function portfwd {
  args=""

  for i in ${@:2}
  do
    echo Forwarding port $i
    args="$args -L $i:localhost:$i"
  done

  ssh $1 $args
}

function docker-wipe {
    docker rm -f -v `docker ps -q -a`
    docker rmi -f `docker images -q`
}

function run {
    ($@ &> /dev/null; echo "Finished $BASHPID with $?") &
}

include "$BASH_SOURCE$EXTEND"
