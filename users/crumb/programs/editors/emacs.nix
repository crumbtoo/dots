{ config, lib, pkgs, ... }:

let my-emacs =
      (pkgs.emacsPackagesFor pkgs.emacs-unstable).emacsWithPackages
        (epkgs: [
          epkgs.treesit-grammars.with-all-grammars
          epkgs.vterm
       ]);
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "0gjbc58vriamzmkdg2b6mif6vm3a4qlsvkfpylpd676jhfl12wpl";
    }))
  ];

  home.packages = with pkgs; [
    ## emacs
    binutils       # native-comp needs 'as', provided by this
    # my-emacs

    ## doom dependencies
    git
    ripgrep
    fd
    imagemagick
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })

    # :lang nix
    nil
    age
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
