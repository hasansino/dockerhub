#!/bin/sh

# iptables-restore can be used instead, but rule order is reversed,
# which makes it a bit harder to read.

if [ "$1" = "fw_init" ]; then

  if [ -f /etc/iptables/rules.default.sh ]; then
    echo "Loading default rules..."
    source /etc/iptables/rules.default.sh
  fi
  if [ -f /etc/iptables/rules.custom.sh ]; then
      echo "Loading custom rules..."
      source /etc/iptables/rules.custom.sh
  fi

  fw_exit() {
    echo "Exiting..."
    exit 0
  }

  trap fw_exit SIGINT SIGTERM

  while true; do
    sleep 1
  done

else
  exec "$@"
fi
