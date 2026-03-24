{ ... }:
{
  config.marty.nixosModules = [
    ({ pkgs, ... }: {
      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];
    })
  ];
}
