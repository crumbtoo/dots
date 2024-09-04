{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/shared
  ];

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  modules = {
    gaming.steam.enable = true;
    editors.emacs.enable = true;
  };

  hardware = {
    nvidia.open = false;
    pulseaudio.enable = true;
  };

  time.timeZone = "America/Denver";

  networking = {
    hostName = "guix-rebound";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
  };

  console.useXkbConfig = true;

  services = {
    pipewire.wireplumber.enable = true;
    xserver = {
      enable = true;

      videoDrivers = [ "nvidia" ];

      xkb = {
        layout = "us";
        variant = "";
        options = "ctrl:swapcaps";
      };

      # windowManager.exwm = {
      #   enable = true;
      #   enableDefaultConfig = false;
      #   extraPackages = epkgs: [epkgs.vterm];
      # };
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # desktopManager.xfce.enable = true;
    # displayManager.lightdm = {
    #   enable = true;
    # };

    openssh.enable = true;

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };
  };

  users.users = {
    crumb = {
      isNormalUser = true;
      description = "Madeleine Sydney";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # security.sudo = {
  #   enable = true;
  #   extraRules = [
  #     {
  #       groups = [ "wheel" ];
  #     }
  #   ];
  # };

  system.stateVersion = "24.05"; # Did you read the comment?
}
