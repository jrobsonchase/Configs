#!/bin/bash

gpg -o $(dirname $0)/dotfiles/.mutt/aliases.gpg -e ~/.mutt/aliases
