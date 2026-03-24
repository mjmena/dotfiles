{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  config.marty.features.beerio.nixosModules = [
    inputs.beerio.nixosModules.default
    ({ ... }: {
      services.beerio.enable = true;
      services.beerio.package = inputs.beerio.packages.${system}.default;
      services.beerio.domain = "mjmena.com";
    })
  ];
}
