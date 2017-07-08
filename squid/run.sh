#!/bin/bash

squid -z
squid

tail -f /var/log/squid/cache.log /var/log/squid/access.log  &
PID=$!

close() {
	kill $PID
}

TRAP close SIGINT SIGTERM SIGKILL

wait $PID

echo "Shutting down..."




