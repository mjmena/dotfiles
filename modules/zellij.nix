{ pkgs, ... }:
{
  environment.variables.ZELLIJ_CONFIG_DIR = ./zellij;
  environment.systemPackages = [
    pkgs.zellij
  ];
}
