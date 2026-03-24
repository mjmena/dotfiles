{ inputs, ... }:
{
  config.marty.features.stylix.nixosModules = [
    inputs.stylix.nixosModules.stylix
  ];
}
