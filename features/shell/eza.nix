{ ... }:
{
  config.marty.homeModules = [
    ({ ... }: {
      programs.eza = {
        enable = true;
      };
    })
  ];
}
