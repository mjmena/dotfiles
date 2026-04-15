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
        (pkgs.symlinkJoin {
          name = "discord";
          paths = [ pkgs.discord ];
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/Discord \
              --add-flags "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland"
          '';
        })
        pkgs.r2modman
        (pkgs.symlinkJoin {
          name = "vesktop";
          paths = [ pkgs.vesktop ];
          buildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/vesktop \
              --add-flags "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland"
          '';
        })
        pkgs.spotify
        pkgs.obs-studio
        pkgs.mpv
        pkgs.lutris
      ];
    })
  ];
}
