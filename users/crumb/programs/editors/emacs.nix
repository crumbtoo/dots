{ config, lib, pkgs, ... }:

with lib;
let my-emacs = with pkgs;
      (emacsPackagesFor emacs-unstable).emacsWithPackages (epkgs: [
        epkgs.vterm
      ]);
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "17v6pbmmd8z7p0i2xjnyy7n8lf7ajiywx7fszc98hfvkavqmk8wl";
    }))
  ];

  home.packages = with pkgs; [
    ## emacs
    binutils       # native-comp needs 'as', provided by this
    # my-emacs

    ## doom dependencies
    ripgrep
    fd
    imagemagick

    # :lang nix
    nil
    age
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  services.emacs = {
    enable = true;
    package = my-emacs;
  };

  programs.emacs = {
    enable = true;
    package = my-emacs;
  };
}
