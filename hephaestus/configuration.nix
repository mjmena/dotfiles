{ config, pkgs, ... }:

{
  networking.hostName = "hephaestus"; # Define your hostname.
  networking.firewall.allowedTCPPorts = [ 8080 ];
}

