#!/bin/ksh
log_file="/dev/stdout"
error_log_file="/dev/stderr"
# TODO: all these functions should be in one place and sourced in
function log {
  printf '%(%F %T)T\t %s\n' "-1" "$*" >> $log_file
}

function err {
  printf '%(%F %T)T\t %s\n' "-1" "$*" >> $error_log_file
}

function reverse_ipv4 {
  OIFS=$IFS
  IFS=.
  set -- $1
  echo $4.$3.$2.$1
  IFS=$OIFS
}

for blacklist in $(cat ../blacklists/*.blacklist); do
    dig $(reverse_ipv4 $1).${blacklist} | grep -q -e "NXDOMAIN" -e "NOERROR" ||
        err "blacklist $blacklist returned unexpected things"
done

