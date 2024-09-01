{ config, lib, pkgs, inputs, ... }:

let system = "x86_64-linux";
in
lib.nixosSystem {
  inherit system;

  specialArgs = {inherit inputs;};
  modules = [
    ./configuration.nix
    ./hardware-configuration.nix
    # ./hosts/guix-rebound/configuration.nix
    # ./modules/gaming/steam.nix
    # inputs.home-manager.nixosModules.default
    # inputs.agenix.nixosModules.default
    # { environment.systemPackages = [ inputs.agenix.packages.${system}.default ]; }
  ]
  ++ (lib.mapModulesRec' ../../modules import);
}
