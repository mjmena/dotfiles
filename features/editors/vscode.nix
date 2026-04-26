{ ... }:
{
  config.marty.features.vscode.nixosModules = [
    ({ pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        vscode
      ];
    })
  ];
}
