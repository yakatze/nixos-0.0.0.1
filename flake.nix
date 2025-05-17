{
  description = "tlater's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

  };
  

outputs =
      { nixpkgs, home-manager, ... }@inputs :
      {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              { nixpkgs.config.allowUnfree = true; }
              ./nix/configuration.nix
            ];
        };

        homeConfigurations.yakatze = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [ ./home/home.nix ];
          extraSpecialArgs = {
            inherit inputs;
            lib = nixpkgs.lib;
          };
        };

      };

}
