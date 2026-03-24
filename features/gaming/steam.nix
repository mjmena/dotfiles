{ ... }:
{
  config.marty.features.gaming.nixosModules = [
    ({ pkgs, ... }: {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      environment.systemPackages = [
        pkgs.discord
        pkgs.r2modman
        pkgs.vesktop
        pkgs.spotify
        pkgs.obs-studio
        pkgs.mpv
      ];
    })
  ];
}
