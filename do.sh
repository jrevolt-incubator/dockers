#!/bin/bash

set -u

build() {
	for name in $@; do
		docker build -t jrevolt/$name --rm $name
	done
}

publish() {
	for name in $@; do
		docker push jrevolt/$name
	done
}


"$@"

