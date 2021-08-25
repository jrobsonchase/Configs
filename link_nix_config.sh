#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

[ -f /etc/nixos/hardware-configuration.nix ] && [ -z "$(readlink /etc/nixos/hardware-configuration.nix)" ] && mv /etc/nixos/hardware-configuration.nix ./nixos/etc/nixos/
ln -sf "${PWD}/nixos/etc/nixos/"* /etc/nixos/
