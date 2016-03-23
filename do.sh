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

run() {
	local name="$1"; shift;
	local docker_opts_dflt="-it --rm=true"
	docker run --name $name ${DOCKER_OPTS:-$docker_opts_dflt} --net=host --cap-add=NET_ADMIN jrevolt/$name "$@"
}

start() {
	DOCKER_OPTS="-d" run "$@"
}

shell() {
	local name="$1"
	DOCKER_OPTS="--entrypoint=sh -it --rm=true" run $name -l
}


"$@"

