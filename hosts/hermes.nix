{ ... }:
{
  config.marty.hosts.hermes = {
    hardwareConfig = ../hardware/hermes.nix;

    features = [
      "gnome"
      "firefox"
      "nvim"
      "vscode"
      "stylix"
    ];

    extraNixosModules = [
      ({ ... }: {
        networking.firewall.allowedTCPPorts = [ 8080 ];
      })
    ];
  };
}
