#!/bin/bash

CONF_FILE="/etc/oomkprio.conf"
# TODO: user config

cat $CONF_FILE | while read process_name oom_prio ; do
  [[ -z "$process_name" ]] && continue
  # TODO: skip comments

  for pid in $(pidof $process_name) ; do
    echo $oom_prio > /proc/$pid/oom_adj
  done
done

exit 0
