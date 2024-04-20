#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $0)

stow -v2 -d $SCRIPT_DIR/dots -t ~ --ignore "sound.cache" $@

