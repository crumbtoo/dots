{ lib, config, pkgs, ... }:

with lib;
let cfg = config.modules.editors.emacs;
    my-emacs =
      (pkgs.emacsPackagesFor pkgs.emacs-git).emacsWithPackages
        (epkgs: [
          epkgs.treesit-grammars.with-all-grammars
          epkgs.vterm
       ]);
in {
  options.modules.editors.emacs = {
    enable = mkEnableOption "emacs";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      (import (builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
        sha256 = "0gjbc58vriamzmkdg2b6mif6vm3a4qlsvkfpylpd676jhfl12wpl";
      }))
    ];

    environment.systemPackages = with pkgs; [
      # (lib.mkLauncherEntry "Emacs (Debug Mode)" {
      #   description = "Start Emacs in debug mode";
      #   icon = "emacs";
      #   exec = "${my-emacs}/bin/emacs --debug-init";
      # })

      ## Emacs itself
      binutils       # native-comp needs 'as', provided by this
      # HEAD + native-comp
      my-emacs
      # libvterm

      ## Doom dependencies
      git
      ripgrep
      gnutls              # for TLS connectivity

      ## Optional dependencies
      fd                  # faster projectile indexing
      imagemagick         # for image-dired
      # (mkIf (config.programs.gnupg.agent.enable)
      #   pinentry-emacs)   # in-emacs gnupg prompts
      # zstd                # for undo-fu-session/undo-tree compression

      texliveSmall # for org-mode latex

      ## Module dependencies
      # :checkers spell
      (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))

      # :tools editorconfig
      # editorconfig-core-c # per-project style config

      # :tools lookup & :lang org +roam
      sqlite

      # :lang latex & :lang org (latex previews)
      # texlive.combined.scheme-medium

      # :lang beancount
      # beancount
      # fava

      # :lang nix
      age
      nil
    ];

    # environment.variables.PATH = [ "$XDG_CONFIG_HOME/emacs/bin" ];

    # modules.shell.zsh.rcFiles = [ "${hey.configDir}/emacs/aliases.zsh" ];

    services = {
      emacs = {
        enable = true;
        package = my-emacs;
      };
    };

    fonts.packages = [
      (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}
