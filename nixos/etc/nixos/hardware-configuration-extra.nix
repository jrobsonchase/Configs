{ config, lib, pkgs, modulesPath, ... }:
{
  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/5e1c1095-8946-4268-a7ac-4c574a9dff32";
}
