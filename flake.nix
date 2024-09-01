# vim: sw=2 expandtab
{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # emacs-overlay.url = "github:nix-community/emacs-overlay/master";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        nixosConfigurations.guix-rebound = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/guix-rebound/configuration.nix
            ./modules/gaming/steam.nix
            inputs.home-manager.nixosModules.default
            inputs.agenix.nixosModules.default
            { environment.systemPackages = [ inputs.agenix.packages.${system}.default ]; }
          ];
        };

        homeConfigurations = {
          "crumb" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./users/crumb ];
          };
        };
      };
}
