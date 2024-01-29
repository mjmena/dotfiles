{ config, pkgs, ... }:

{
  networking.hostName = "tower"; # Define your hostname.
  services.xserver.videoDrivers = [ "intel" "nvidia" ];
}

