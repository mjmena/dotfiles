{ ... }:
{
  config.marty.hosts.apheleia = {
    hardwareConfig = ../hardware/apheleia.nix;

    features = [
      "ssh-server"
      "nginx"
      "beerio"
    ];
  };
}
