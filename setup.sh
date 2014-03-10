#!/bin/zsh

if [[ ! -d ~/.cask ]]; then
  curl -fsSkL https://raw.github.com/cask/cask/master/go | python
fi

~/.cask/bin/cask install
