#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE}")"

git pull -q origin master

function rsync_cmd() {
	rsync $1 --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	rsync_cmd
    # running source ~/.bash_profile with -e currently errors out
	source ~/.bash_profile || :
else
    rsync_cmd '--dry-run'
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		rsync_cmd
	fi
fi
unset rsync_cmd
