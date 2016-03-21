#!/bin/bash

set -u

build() {
	local name="$1"
	docker build -t jrevolt/$name --rm $name
}

build "$@"

