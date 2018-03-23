#!/bin/bash

set -u

loadenv() {
	local name="$1"
	[ -f $name/env.sh ] && source $name/env.sh
}

build() {
	for path in $@; do
		loadenv $path
		local name="${path/\/*/}"
		docker build --pull=${pull:-true} -t jrevolt/${name/\/*/}:build --rm $name
	done
}

publish() {
	for path in $@; do
		loadenv $path
		local name="${path/\/*/}"
		docker tag jrevolt/$name:build jrevolt/$name:$TAG
		docker push jrevolt/$name:$TAG
		echo "Pushed jrevolt/${name}:${TAG}"
	done
}

publish_latest() {
	for path in $@; do
		loadenv $path
		local name="${path/\/*/}"
		docker tag jrevolt/$name:build jrevolt/$name:latest
		docker push jrevolt/$name:latest
		echo "Pushed jrevolt/$name:latest"
	done
}

run() {
	local path="$1"; shift;
	local name="${path/\/*/}"
	local docker_opts_dflt="--rm=true -v $HOME/.jrevolt:/root/.jrevolt"
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

