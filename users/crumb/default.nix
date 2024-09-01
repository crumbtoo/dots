# vim: sw=2 expandtab
{ config, pkgs, ...}@inputs:

{
  home.file = import ./files.nix inputs;

  # TODO: move to some `overlays/default.nix`, where it may be easily shared
  # by both `modules/shared` and `users/*`.

  nixpkgs = {
    config = {
      allowUnfree = true;
      # allowBroken = true;
      # allowInsecure = false;
      # allowUnsupportedSystem = true;
      # packageOverrides = pkgs: with pkgs; {
      #   pidgin-with-plugins = pkgs.pidgin.override {
      #     plugins = [
      #       (purple-discord.overrideAttrs (final: prev: {
      #         makeFlags = [ "USE_QRCODE_AUTH=1" ];
      #         nativeBuildInputs = prev.nativeBuildInputs ++ [pkgs.qrencode];
      #       }))
      #     ];
      #   };
      # };
    };
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crumb";
  home.homeDirectory = "/home/crumb";

  home.packages = with pkgs; [
    firefox
    (nerdfonts.override { fonts = [ "VictorMono" ]; })
    jujutsu
    direnv
    vesktop
  ];

  services = {
    lorri.enable = true;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";

  imports = [
    ./programs/editors/emacs.nix
  ];
}
