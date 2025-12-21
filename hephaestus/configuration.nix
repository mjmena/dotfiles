{ config, pkgs, ... }:

{
  networking.hostName = "hephaestus"; # Define your hostname.
  networking.firewall.allowedTCPPorts = [
    3000
    8080
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  environment.systemPackages = [
    pkgs.r2modman
    pkgs.slack
    pkgs.google-chrome
    pkgs.libreoffice-fresh
    pkgs.prismlauncher
    pkgs.flameshot
  ];
}
