{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      programs.direnv.enable = true;
    })
  ];

  config.marty.homeModules = [
    ({ ... }: {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };
    })
  ];
}
