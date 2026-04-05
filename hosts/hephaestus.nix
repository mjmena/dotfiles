{ ... }:
{
  config.marty.hosts.hephaestus = {
    hardwareConfig = ../hardware/hephaestus.nix;

    features = [
      "gnome"
      "firefox"
      "nvim"
      "vscode"
      "gaming"
      "vpn"
      "work-apps"
      "antigravity"
    ];

    extraNixosModules = [
      ({ ... }: {
        networking.firewall.allowedTCPPorts = [
          3000
          8080
        ];
      })
    ];
  };
}
