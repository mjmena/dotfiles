{ ... }:
{
  config.marty.homeModules = [
    ({ ... }: {
      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          directory.truncate_to_repo = false;
          nix_shell.format = "in [\$symbol](\$style)";
          package.disabled = true;
          cmd_duration.disabled = true;
        };
      };
    })
  ];
}
