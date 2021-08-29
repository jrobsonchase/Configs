{
  description = "Home manager";
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = {self, home-manager, ...}:
  {
    defaultApp."x86_64-linux" = {
      type = "app";
      program = "${home-manager.packages.x86_64-linux.home-manager}/bin/home-manager";
    };
    homeConfigurations = {
      josh = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/josh";
        username = "josh";
        stateVersion = "21.11";
        configuration = import ./home.nix;
      };
    };
  };
}
