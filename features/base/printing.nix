{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      services.printing.enable = true;
    })
  ];
}
