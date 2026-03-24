{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  config.marty.features.antigravity.nixosModules = [
    ({ ... }: {
      environment.systemPackages = [
        inputs.antigravity-nix.packages.${system}.default
      ];
    })
  ];
}
