{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      programs.zsh.enable = true;
    })
  ];

  config.marty.homeModules = [
    ({ ... }: {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
          ls = "eza -1 --icons --git-ignore";
        };
        initContent = ''
          # Ensure starship, zoxide, and direnv are properly initialized if not already handled by HM
        '';
      };
    })
  ];
}
