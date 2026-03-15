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
    ./modules/vscode.nix
  ];

  environment.systemPackages = [
    pkgs.vesktop
    pkgs.libreoffice-fresh
    pkgs.spotify
    inputs.antigravity-nix.packages.x86_64-linux.default
    pkgs.google-chrome
    pkgs.prismlauncher
    inputs.claude-code-nix.packages.x86_64-linux.default
    pkgs.snowsql
  ];

  environment.sessionVariables = {
    COSMIC_DISABLE_DIRECT_SCANOUT = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  services.system76-scheduler.enable = true;

}
