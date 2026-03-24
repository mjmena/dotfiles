{ ... }:
{
  config.marty.homeModules = [
    ({ pkgs, ... }: {
      home.packages = [
        pkgs.lazygit
        pkgs.bat
        pkgs.devenv
        pkgs.btop
      ];
    })
  ];
}
