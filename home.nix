{ config, lib, pkgs, ... }:

rec {
  imports = [
    ./desktop/default.nix
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    enableScDaemon = true;
  };

  programs.git = {
    enable = true;
    userName = "Josh Robson Chase";
    userEmail = "josh@robsonchase.com";
    aliases = {
      lg = "log --graph --pretty=format:'%Cred%h%Creset %C(green)%G?%Creset%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    extraConfig = {
      rerere.enabled = true;
      tag.forceSignAnnotated = true;
    };
    signing = {
      signByDefault = true;
      key = null;
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default.settings = {
      "browser.ctrlTab.sortByRecentlyUsed" = true;
    };
  };

  home.packages = with pkgs; [
    vim_configurable
    font-awesome
    fira-code
    stow
    dunst
    gnupg
    ripgrep
    picom
    ibus
    polybarFull
    libnotify
    tree
    file
  ];
}
