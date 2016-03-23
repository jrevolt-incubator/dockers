#!/bin/bash

run() {
	#mkdir -p /var/log/dnsmasq
	#tail -F /var/log/dnsmasq/dnsmasq.log &
	dnsmasq --keep-in-foreground --conf-file=/etc/dnsmasq.conf --log-queries --log-dhcp --log-facility=- --log-async "$@"
	wait $!
}

version() {
	dnsmasq --version
}


help() {
cat << EOF
Usage: (run|version|help) <options>
$(version)
EOF
}


"${@:-help}"

