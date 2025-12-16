{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./modules/firefox.nix
    ./modules/nvim.nix
  ];

  environment.systemPackages = [
    pkgs.vesktop
    pkgs.libreoffice-fresh
    pkgs.spotify
    inputs.antigravity-nix.packages.x86_64-linux.default
  ];

  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  services.system76-scheduler.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = "marty";
  };
}
