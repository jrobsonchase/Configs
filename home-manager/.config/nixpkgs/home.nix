{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "josh";
  home.homeDirectory = "/home/josh";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    enableScDaemon = true;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.numix-gtk-theme;
      name = "Numix";
    };
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

  home.packages = with pkgs; [
    vim_configurable
    font-awesome
    fira-code
    polybarFull
    rofi
    stow
    dunst
    dex
    gnupg
    ripgrep
    picom
    ibus
    parcellite
    dconf
  ];
}
