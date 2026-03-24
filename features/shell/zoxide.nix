{ ... }:
{
  config.marty.homeModules = [
    ({ ... }: {
      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    })
  ];
}
