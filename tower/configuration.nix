{ config, pkgs, ... }:

{
  networking.hostName = "tower"; # Define your hostname.
  services.xserver.videoDrivers = [ "intel" "nvidia" ];

  environment.systemPackages = [
    pkgs.wineWowPackages.stable
    pkgs.lutris
  ];
}

