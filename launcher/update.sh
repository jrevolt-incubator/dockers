#!/bin/bash

cd $(dirname $0)

repo="http://repo.jrevolt.io"
groupid="io.jrevolt.launcher"
artifactid="io.jrevolt.launcher"
version="develop-SNAPSHOT"
reponame="snapshots"
urljar="${repo}/service/local/artifact/maven/redirect?r=${reponame}&g=${groupid}&a=${artifactid}&v=${version}&e=jar"
wget --content-disposition -N $urljar

ls -la