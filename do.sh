#!/bin/bash

set -u

loadenv() {
	local name="$1"
	[ -f $name/env.sh ] && source $name/env.sh
}

build() {
	for name in $@; do
		loadenv $name
		docker build -t jrevolt/$name:build --rm $name
	done
}

publish() {
	for name in $@; do
		loadenv $name
		docker tag jrevolt/$name:build jrevolt/$name:$TAG
		docker push jrevolt/$name:$TAG
	done
}

run() {
	local name="$1"; shift;
	local docker_opts_dflt="-it --rm=true -v $HOME/.jrevolt:/root/.jrevolt"
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

