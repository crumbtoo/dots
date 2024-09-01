{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    home-manager
    cachix
    age
    dropbox-cli
    # maestral
  ];

  imports = [
    ./cachix.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      #cudaSupport = true;
      #cudaCapabilities = ["8.0"];
      allowBroken = true;
      allowInsecure = false;
      allowUnsupportedSystem = true;
    };

    overlays =
      # Apply each overlay found in the /overlays directory
      let path = ../../overlays; in with builtins;
            map (n: import (path + ("/" + n)))
              (filter (n: match ".*\\.nix" n != null ||
                          pathExists (path + ("/" + n + "/default.nix")))
                (attrNames (readDir path)))

            ++ [(import (builtins.fetchTarball {
              url = "https://github.com/dustinlyons/emacs-overlay/archive/refs/heads/master.tar.gz";
              sha256 = "06413w510jmld20i4lik9b36cfafm501864yq8k4vxl5r4hn0j0h";
            }))];
  };

  nix.settings.trusted-users = [ "root" "crumb" ];

  networking.firewall = {
    allowedTCPPorts = [ 17500 ];
    allowedUDPPorts = [ 17500 ];
  };

  systemd.user.services.dropbox = {
    description = "Dropbox";
    wantedBy = [ "graphical-session.target" ];
    environment = {
      QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
      QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
    };
    serviceConfig = {
      ExecStart = "${lib.getBin pkgs.dropbox}/bin/dropbox";
      ExecReload = "${lib.getBin pkgs.coreutils}/bin/kill -HUP $MAINPID";
      KillMode = "control-group"; # upstream recommends process
      Restart = "on-failure";
      PrivateTmp = true;
      ProtectSystem = "full";
      Nice = 10;
    };
  };

  # systemd.user.services.maestral = {
  #   description = "Maestral";
  #   after = [ "network.target" ];
  #   wantedBy = [ "default.target" ];
  #   serviceConfig = {
  #     ExecStart = "${lib.getBin pkgs.maestral}/bin/maestral";
  #     ExecReload = "${lib.getBin pkgs.coreutils}/bin/kill -HUP $MAINPID";
  #     KillMode = "control-group"; # upstream recommends process
  #     Restart = "on-failure";
  #     PrivateTmp = true;
  #     ProtectSystem = "full";
  #     Nice = 10;
  #   };
  # };
}
