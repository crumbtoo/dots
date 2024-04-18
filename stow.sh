#!/usr/bin/env bash

stow -v2 -d ~/guix-config/dots -t ~ --ignore "sound.cache" $@

