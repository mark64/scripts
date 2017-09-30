#!/bin/sh
# creates a bare git repo for use on a git server

if [ $# -lt 1 ]; then
	printf "needs a repo name\n"
	exit 1
fi

REPO_NAME=$HOME/html/$1.git

mkdir -p $REPO_NAME
git init --bare --shared=group $REPO_NAME

