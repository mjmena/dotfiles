{ ... }:
{
  config.marty.hosts.gaia = {
    hardwareConfig = ../hardware/gaia.nix;

    features = [
      "ssh-server"
      "minecraft"
      "stylix"
    ];

    extraNixosModules = [
      ({ pkgs, ... }: {
        stylix.fonts.sizes = {
          terminal = 18;
        };

        environment.systemPackages = [
          pkgs.superTuxKart
        ];
      })
    ];
  };
}
